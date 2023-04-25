﻿#pragma once

#include "fbxsdk.h"
#include "Model.h"

#include <d3d12.h>
#include <d3dx12.h>
#include <string>

class FbxLoader
{

private: // エイリアス
	// std::を省略
	using string = std::string;

public: // 定数
	// モデル格納ルートパス
	static const string baseDirectory;


public:
	/// <summary>
	/// シングルトンインスタンスの取得
	/// </summary>
	/// <returns>インスタンス</returns>
	static FbxLoader* GetInstance();

	/// <summary>
	/// 初期化
	/// </summary>
	/// <param name="device">D3D12デバイス</param>
	void Initialize(ID3D12Device* device);

	/// <summary>
	/// 後始末
	/// </summary>
	void Finalize();

	/// <summary>
	/// ファイルからFBXモデル読込
	/// </summary>
	/// <param name="modelName">モデル名</param>
	void LoadModelFromFile(const string& modelName);

	/// <summary>
	/// 再帰的にノード構成を解析
	/// </summary>
	/// <param name="model">読み込み先モデルオブジェクト</param>
	/// <param name="fbxNode">解析対象のノード</param>
	void ParseNodeRecursive(Model* model, FbxNode* fbxNode, Node* parent = nullptr);


private:
	// privateなコンストラクタ（シングルトンパターン）
	FbxLoader() = default;
	// privateなデストラクタ（シングルトンパターン）
	~FbxLoader() = default;
	// コピーコンストラクタを禁止（シングルトンパターン）
	FbxLoader(const FbxLoader& obj) = delete;
	// コピー代入演算子を禁止（シングルトンパターン）
	void operator=(const FbxLoader& obj) = delete;
	// D3D12デバイス
	ID3D12Device* device = nullptr;
	// FBXマネージャ
	FbxManager* fbxManager = nullptr;
	// FBXインポータ
	FbxImporter* fbxImporter = nullptr;
};
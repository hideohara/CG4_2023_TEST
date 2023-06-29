
#include "PostEffectTest.hlsli"

Texture2D<float4> tex0 : register(t0);
Texture2D<float4> tex1 : register(t1); // 1番スロットに設定されたテクスチャ
SamplerState smp : register(s0);

float4 main(VSOutput input) : SV_TARGET
{
// UV指定したピクセルの色をサンプリング
    //float4 texcolor = tex.Sample(smp, input.uv);
    //return float4(texcolor.rgb, 1);
// アルファに1を入れて出力
    
    //float4 texcolorTotal = 0;
    //for (int y = -1; y <= 1; y++)
    //{
    //    for (int x = -1; x <= 1; x++)
    //    {
    //        float4 texcolor = tex.Sample(smp, input.uv + float2(x / 640.0f, y / 360.f));
    //        texcolorTotal += texcolor;
    //    }
    //}
    //texcolorTotal = texcolorTotal / 9;
    //return float4(texcolorTotal.rgb, 1);
    
    float4 colortex0 = tex0.Sample(smp, input.uv);
    float4 colortex1 = tex1.Sample(smp, input.uv);

    float4 color = colortex0;
    if (fmod(input.uv.y, 0.1f) < 0.05f)
    {
        color = colortex1;
    }

    return float4(color.rgb, 1);
}



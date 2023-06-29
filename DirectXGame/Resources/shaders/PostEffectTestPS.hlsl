
#include "PostEffectTest.hlsli"

Texture2D<float4> tex : register(t0);
SamplerState smp : register(s0);


float4 main(VSOutput input) : SV_TARGET
{
// UV�w�肵���s�N�Z���̐F���T���v�����O
    //float4 texcolor = tex.Sample(smp, input.uv);
    //return float4(texcolor.rgb, 1);
// �A���t�@��1�����ďo��
    
    float4 texcolorTotal = 0;
    for (int y = -1; y <= 1; y++)
    {
        for (int x = -1; x <= 1; x++)
        {
            float4 texcolor = tex.Sample(smp, input.uv + float2(x / 640.0f, y / 360.f));
            texcolorTotal += texcolor;
        }
    }
    texcolorTotal = texcolorTotal / 9;
    return float4(texcolorTotal.rgb, 1);
    
}



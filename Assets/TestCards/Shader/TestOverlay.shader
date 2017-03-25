Shader "Hidden/TestCards/Overlay"
{
    Properties
    {
        _MainTex("", 2D) = "black"{}
        _PatternTex("", 2D) = "black"{}
        _Color("", Color) = (0.5, 0.5, 0.5)
    }

    CGINCLUDE

    #include "UnityCG.cginc"

    sampler2D _MainTex;
    float4 _MainTex_TexelSize;

    sampler2D _PatternTex;
    half3 _Color;
    float _Scale;

    // Hue to RGB convertion
    half3 HueToRGB(half h)
    {
        h = frac(h);
        half r = abs(h * 6 - 3) - 1;
        half g = 2 - abs(h * 6 - 2);
        half b = 2 - abs(h * 6 - 4);
        half3 rgb = saturate(half3(r, g, b));
        return rgb;
    }

    half4 frag_fill(v2f_img i) : SV_Target
    {
        return half4(_Color, 1);
    }

    half4 frag_spectrum(v2f_img i) : SV_Target
    {
        half3 rgb = lerp(HueToRGB(i.uv.x), i.uv.x, i.uv.y > 0.5);
        #if !defined(UNITY_COLORSPACE_GAMMA)
        rgb = GammaToLinearSpace(rgb);
        #endif
        return half4(rgb, 1);
    }

    half4 frag_checker(v2f_img i) : SV_Target
    {
        float2 c = step(0.4999, frac(i.uv.xy * _MainTex_TexelSize.zw * _Scale));
        return abs(c.x - c.y);
    }

    half4 frag_pattern(v2f_img i) : SV_Target
    {
        return tex2D(_PatternTex, i.uv.xy);
    }

    ENDCG

    SubShader
    {
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag_fill
            ENDCG
        }
        Pass
        {
            CGPROGRAM
            #pragma multi_compile __ UNITY_COLORSPACE_GAMMA
            #pragma vertex vert_img
            #pragma fragment frag_spectrum
            ENDCG
        }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag_checker
            ENDCG
        }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag_pattern
            ENDCG
        }
    }
}

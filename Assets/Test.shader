Shader "Unlit/Test"
{
    Properties
    {
        [KeywordEnum(Fill, Spectrum, Checker)]
        _Mode("Mode", Int) = 0
        _Color("Color", Color) = (0.5, 0.5, 0.5)
        _Scale("Scale", Float) = 1
    }

    CGINCLUDE

    #include "UnityCG.cginc"

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

    struct appdata
    {
        float4 vertex : POSITION;
        float2 uv : TEXCOORD0;
    };

    struct v2f
    {
        float4 vertex : SV_POSITION;
        float2 uv : TEXCOORD0;
    };

    half3 _Color;
    half _Scale;

    v2f vert(appdata v)
    {
        v2f o;
        o.vertex = UnityObjectToClipPos(v.vertex);
        o.uv = v.uv;
        return o;
    }

    half4 frag(v2f i) : SV_Target
    {
        half3 rgb;

        #if defined(_MODE_FILL)
        rgb = _Color;
        #endif

        #if defined(_MODE_SPECTRUM)
        if (i.uv.y < 0.5)
            rgb = GammaToLinearSpace(HueToRGB(i.uv.x));
        else
            rgb = GammaToLinearSpace(i.uv.x);
        #endif

        #if defined(_MODE_CHECKER)
        float x = fmod(floor(i.uv.x * _ScreenParams.x * _Scale), 2);
        float y = fmod(floor(i.uv.y * _ScreenParams.y * _Scale), 2);
        rgb = fmod(x + y, 2);
        #endif

        return half4(rgb, 1);
    }

    ENDCG

    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile _MODE_FILL _MODE_SPECTRUM _MODE_CHECKER
            ENDCG
        }
    }
}

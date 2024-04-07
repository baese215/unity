Shader "Custom/ColorchangeShader"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.5
        _Hue ("Hue", Range(0,1)) = 1
        _Saturation ("Saturation", Range(0,1)) = 1
        _Value ("Value", Range(0,1)) = 1
        _Alpha ("Alpha", Range(0,1)) = 1
        
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma vertex vert
        #pragma fragment frag

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        struct appdata
        {
            float4 vertex : POSITION;
        };

        struct v2f
        {
            float4 vertex : SV_POSITION;
            fixed4 color : COLOR;
        };

        float4 _Hue;
        float4 _Saturation;
        float4 _Value;
        float4 _Alpha;

        v2f vert(appdata v)
        {
            v2f o;
            o.vertex = UnityObjectToClipPos(v.vertex);
            return o;
        };

        fixed4 frag(v2f i) : SV_Target
        {   
            // Convert HSV to RGB
            float H = _Hue.x * 360.0;
            float S = _Saturation.x;
            float V = _Value.x;
            float C = V * S;
            float hue60 = H / 60.0f;  // Calculate normalized hue value
            float repeatedHue = fmod(hue60, 2.0f);  // Ensure hue value remains within [0, 2)
            float absDiff = abs(repeatedHue - 1.0f);  // Calculate absolute difference from 1
            float X = C * (1.0f - absDiff);  // Calculate X component
            float m = V - C;
            float r = 0, g = 0, b = 0;

            if ( 0 <= H && H < 60)
            {
                r = C;
                g = X;
            }
            else if (60 <= H && H < 120)
            {
                r = X;
                g = C;
            }
            else if (120 <= H && H < 180)
            {
                g = C;
                b = X;
            }
            else if (180 <= H && H < 240)
            {
                g = X;
                b = C;
            }
            else if (240 <= H && H < 300)
            {
                r = X;
                b = C;
            }
            else if (300 <= H && H < 360)
            {
                r = X;
                g = C;
            }
            fixed4 color = fixed4((r+m), (g+m), (b+m), _Alpha);
            return color;
        }
        ENDCG
    }
}
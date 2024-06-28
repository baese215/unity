Shader "Hidden/camera1shader 1"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;

            float3 CustomColorFunction(float3 color255)
            {
                float red = color255.r;
                float green = color255.g;
                float blue = color255.b;

                if (color255.b < 130)
                {
                    float red = (color255.r + color255.g)/2;
                    float green = (color255.r + color255.g + color255.b)/3;
                    float blue = color255.b;
                }
                
                else
                {
                    float red = (color255.r + color255.g + color255.b)/3;
                    float green = (color255.r + color255.g)/2;
                    float blue = color255.b;
                }

                return float3(red, green, blue);
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 color = tex2D(_MainTex, i.uv);

                // Convert 0-1 range to 0-255
                float3 color255 = color.rgb * 255.0;

                // Apply custom function to calculate new color
                float3 newColor255 = CustomColorFunction(color255);

                // Convert 0-255 range back to 0-1
                float3 newColor = newColor255 / 255.0;

                return fixed4(newColor, color.a);
            }

            ENDCG
        }
    }
}

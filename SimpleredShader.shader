Shader "Custom/SimpleRedShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert //설정
            #pragma fragment frag //설정
            #include "UnityCG.cginc" //Unity의 내장 함수나 기능을 사용할 수 있게 함

            struct appdata //구조체 불러옴
            {
                float4 vertex : POSITION; //위치정보를 가진 appdata의 '정점' 변수
                float2 uv : TEXCOORD0; //텍스처좌표를 나타내는 appdata의 'uv' 변수
            };

            struct v2f //구조체 불러옴
            {
                float2 uv : TEXCOORD0; //텍스처좌표를 나타내는 v2f의 'uv' 변수
                float4 vertex : SV_POSITION; //최종위치정보를 가진 v2f의 변수
            };

            sampler2D _MainTex; //텍스처 변수 선언
            float4 _MainTex_ST; //앞줄에 선언한 텍스처 변수의 크기와 위치정보를 저장하는 float4형식 변수
        

            v2f vert (appdata v) //v라고 명명한 appdata 구조체를 입력으로 받고
                                    //v2f 구조체를 출력하는 함수 선언
            {
                v2f o; //앞으로 v2f 구조체를 o라고 명명함
                o.vertex = UnityObjectToClipPos(v.vertex); //모델 공간에서 클립 공간으로 변환하는 함수
                o.uv = TRANSFORM_TEX(v.uv, _MainTex); //텍스처의 uv좌표를 변환하는 함수
                return o; //변환된 데이터를 반환하여 렌더링될 화면에 적용함
            }

            fixed4 frag (v2f i) : SV_Target //Fragment Shader 함수 정의
                                            //픽셀 셰이더로서 화면에 그려지는 각 픽셀에 대한 색상을 계산함
            {
                // 빨간색으로 고정된 색상 출력
                return fixed4(1,0,0,1); // 빨강, 녹색, 파랑, 알파
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
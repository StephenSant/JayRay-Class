﻿Shader "Intro to Shaders/Shaders with JayRay/EthanFog"
{
    Properties
    {
        _FogColor ("Fog Color", Color) = (1,1,1,1)
        _MainTex ("Texture", 2D) = "white" {}

    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface mainColour Lambert finalcolor:fogcolour vertex:vert

        sampler2D _MainTex;
        fixed4 _FogColor;

        struct Input
        {
            float2 uv_MainTex;
            half fog;
        };

        void vert(inout appdata_full v, out Input data)
        {
            UNITY_INITIALIZE_OUTPUT(Input, data);
            float4 hpos = UnityObjectToClipPos(v.vertex);
            hpos.xy / hpos.w;
			data.fog = min(1,dot(hpos.xy,hpos.xy)*0.5);
        }

        void fogcolour(Input IN, SurfaceOutput o, inout fixed4 colour)
        {
			fixed3 fogColour = _FogColor.rgb;
			#ifdef UNITY_PASS_FORWARDADD
			fogColour=0;
			#endif
			colour.rgb = lerp(colour.rgb, fogColour,IN.fog);
        }

        void mainColour(Input IN, inout SurfaceOutput o)
        {
			o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
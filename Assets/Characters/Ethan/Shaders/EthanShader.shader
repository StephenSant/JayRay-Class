Shader "Intro to Shaders/Shaders with JayRay/EthanShader"
{
    Properties
	{
		// Does not need a semi-colon at this part
		// <<variableName ("displayName", dataType) = value>>		
		_MainTexture ("Diffuse Texture", 2D) = "white"{} //<-- A 2D texture
		_TintColour ("Tint", Color) = (1,1,1,1)
	}
	SubShader
	{
		Tags
		{
			//Still no semi-colons
			"RenderType" = "Opaque"
		}
		CGPROGRAM //Semi-colons start here
		#pragma surface surf Lambert//Is it called surfing because you're on the SURFace of the water???
		sampler2D _MainTexture;
		fixed4 _TintColour;
		struct Input 
		{
		float2 uv_MainTexture;
		};//<--The hell is this semi-colon action?
		void surf(Input IN,inout SurfaceOutput o)
		{
			o.Albedo = tex2D (_MainTexture, IN.uv_MainTexture).rgb* _TintColour;
		}
		
		ENDCG //No more semi-colons after this
	}
	Fallback "Diffuse"
}

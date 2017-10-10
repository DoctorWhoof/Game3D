Namespace game3d

Class MaterialLibrary
	
	Private
	Global _allMaterials := New Map< String,Material >
	Global _allTextures := New Map< String,Texture >
	Global _allMaterialNames := New Map< Material, String >
	Global _allTextureNames := New Map< Texture, String >
	Global _allTexturePaths := New Map< String, String >
	
	Public
	
	'******************************** materials '********************************
	
	Function AddMaterial( name:String, mat:Material )
		_allMaterials.Add( name, mat )
		_allMaterialNames.Add( mat, name )
	End
	
	Function GetMaterial:Material( name:String )
		If Not name Return Null
		Return _allMaterials[ name ]	
	End
	
	Function GetName:String( mat:Material )
		Return _allMaterialNames[ mat ]	
	End
	
	Function AddTexture( name:String, tex:Texture )
		_allTextures.Add( name, tex )
		_allTextureNames.Add( tex, name )
	End
	
	Function AddTexturePath( name:String, path:String )
		_allTexturePaths.Add( name, path )
	End
	
	'******************************** textures '********************************
	
	Function GetTexture:Texture( name:String )
		If Not name Return Null
		Return _allTextures[ name ]	
	End
	
	Function GetTexturePath:String( name:String )
		If Not name Return Null
		Return _allTexturePaths[ name ]	
	End
	
	Function GetName:String( tex:Texture )
		Return _allTextureNames[ tex ]	
	End
	
	'******************************** I/O '********************************
	
	Function Save:JsonObject( path:String )
		Local json := New JsonObject
		Local texturesJson:= New JsonObject
		Local materialsJson:= New JsonObject
		
		'textures!
		For Local name := Eachin _allTextures.Keys
			texturesJson.SetObject( name, _allTextures[name].ToJson().ToObject() )
		End
		
		'materials!
		For Local name := Eachin _allMaterials.Keys
			materialsJson.SetObject( name, _allMaterials[name].ToJson().ToObject()  )
'			materialsJson.Serialize( name, Variant( _allMaterials[ name ] ) )
		End
		
		'combine!
		json.SetObject( "Textures", texturesJson.ToObject() )
		json.SetObject( "Materials", materialsJson.ToObject() )
		
		'Doesn't save yet...
		Return json
	End
	
End


'To do: material load from Json!
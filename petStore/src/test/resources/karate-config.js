function(){
	var config={}
	var env = karate.properties['karate.env'];
	karate.log('Environment test is running : '+env);
	karate.configure('connectTimeout', 60000);
	karate.configure('readTimeout', 60000);
	if(env == 'PR'){
		config={
				env:'PR',
				url:'https://petstore.swagger.io/'
		}
	}
	
	return config;
}
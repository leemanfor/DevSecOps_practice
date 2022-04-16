<ol>
 <h1> Ansible_apache - 5 STIGs below. </h1> 
	<ol>
   <li> The Apache web server must generate a session ID using as much of the character set as possible to reduce the risk of brute force. </li>
		
		LoadModule unique_id_module modules/mod_unique_id.so
   
   <li> The Apache web server must have Web Distributed Authoring (WebDAV) disabled.</li>
		
		Not present
		dav_module
		dav_fs_module
		dav_lock_module
		
   <li>	The Apache web server must be configured to use a specified IP address and port.</li>
		
		Listen 192.168.99.100:80
		Listen 192.168.99.100:443
		
   <li> The Apache web server must limit the number of allowed simultaneous session requests.</li>
		
		# KeepAlive: Enable/disable persistent connections
		  KeepAlive On

		# KeepAliveTimeout: Number of seconds to wait for the next request from the
		# same client on the same connection. Default is 5 seconds
		  KeepAliveTimeout 15

		# MaxKeepAliveRequests: How many requests to allow during a persistent connection. 
		# You can set it 0 for unlimited requests, but it is not recommended.
		 MaxKeepAliveRequests 100
				
   <li> The Apache web server must prohibit or restrict the use of nonsecure or unnecessary ports, protocols, modules, and/or services.</li>
	</ol>

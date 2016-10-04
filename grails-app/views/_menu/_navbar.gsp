<nav class="navbar navbar-nhs navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<a class="navbar-brand navbar-right" style="margin-right: 0" href="${createLink(uri: '/index/index')}"><img src="${resource(plugin: 'kickstart', dir:'images', file:'OUH-FT-logo-white.png')}" height="30px" alt="OUH FT Logo" /></a>
		<div class="navbar-header" style="color: #ffffff">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>

		<div id="navbar" class="collapse navbar-collapse" role="navigation">
			<ul class="nav navbar-nav">
				<g:render template="/_menu/controller"/>
			</ul>

			<ul class="nav navbar-nav">
				<g:render template="/_menu/search"/>
				<g:render template="/_menu/admin"/>
				<g:render template="/_menu/info"/>
				<g:render template="/_menu/user"/><!-- NOTE: the renderDialog for the "Register" modal dialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
				<g:render template="/_menu/language"/>
			</ul>
		</div>
	</div>
</nav>
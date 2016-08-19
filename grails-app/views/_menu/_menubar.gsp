<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_USER">
	<g:if test="${params.controller != 'home'}">
		<ul class="nav nav-tabs">

			<g:if test="${params.controller == 'index'}">
				<li>
					<g:link controller="index" action="index" style="color: #00b900">Main Menu</g:link>
				</li>
			</g:if>
			<g:else>
				<li>
					<g:link controller="index" action="index" style="color: #00b900">Back To Main Menu</g:link>
				</li>
			</g:else>

		</ul>
	</g:if>
</sec:ifAnyGranted>
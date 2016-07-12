<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_USER">
	<g:if test="${params.controller != 'home'}">
		<ul class="nav nav-tabs">

			<g:if test="${params.controller != 'index'}">
				<li>
					<g:link controller="index" action="index">Home</g:link>
				</li>
			</g:if>


			%{--<li>--}%
				%{--<g:link controller="referralRecord" action="index">Referral</g:link>--}%
			%{--</li>--}%

		</ul>
	</g:if>
</sec:ifAnyGranted>
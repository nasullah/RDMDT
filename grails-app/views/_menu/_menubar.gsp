<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_USER">
	<ul class="nav nav-tabs">

		<li>
			<g:link controller="clinician" action="index">Clinician</g:link>
		</li>

		<li>
			<g:link controller="referralRecord" action="index">Referral</g:link>
		</li>

	</ul>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_ADMIN">
	<li class="dropdown dropdown-btn">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: white">
			<i class="glyphicon glyphicon-list"></i>
			Lists
		</a>

		<ul class="dropdown-menu" style="height: auto; max-height: 350px; width: 200px; overflow-x: hidden;">
			<li class="">
				<a href="${createLink(uri: '/clinician/list')}">
					<i class="glyphicon glyphicon-list"></i>
					All Clinicians
				</a>
			</li>

			<li class="">
				<a href="${createLink(uri: '/referralRecord/list')}">
					<i class="glyphicon glyphicon-list"></i>
					All Applications
				</a>
			</li>

			<li class="">
				<a href="${createLink(uri: '/referralRecord/submittedApplication')}">
					<i class="glyphicon glyphicon-list"></i>
					Submitted Applications
				</a>
			</li>
		</ul>
	</li>
</sec:ifAnyGranted>
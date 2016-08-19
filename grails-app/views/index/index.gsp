<%@ page import="rdmdt.Clinician" %>


<html>

<head>
	<title>Welcome to Genomic Medicine MDT Referral Portal</title>
	<meta name="layout" content="kickstart" />
	<style>
	#rcorner1 {
		border-radius: 25px;
		background: rgba(255, 240, 99, 0.09);
		border: 2px solid #8AC007;
		padding: 20px;
		width: 310px;
		height: 200px;
	}

	#rcorner2 {
		border-radius: 25px;
		background: rgba(255, 240, 99, 0.09);
		border: 2px solid #8AC007;
		padding: 20px;
		width: 310px;
		height: 200px;
	}

	#rcorner3 {
		border-radius: 25px;
		background: rgba(255, 240, 99, 0.09);
		border: 2px solid #8AC007;
		padding: 20px;
		width: 310px;
		height: 200px;
	}
	</style>
</head>

<body>

<br/>

<br/>

<br/>

<br/>

<sec:ifAnyGranted roles="ROLE_USER, ROLE_ADMIN">
	<section id="info">
		<div>

			<div class="col-md-1" id="rcorner1">
				<div class="center">
					<h4><i class="glyphicon glyphicon-user"></i> Your Profile</h4>
				</div>
				<br/>

				<g:if test="${clinician}">
					<ul>
						<li><g:link controller="clinician" action="show" params="[id:clinician?.id]"> View your details</g:link></li>
					</ul>

					<ul>
						<li><g:link controller="clinician" action="edit" params="[id:clinician?.id]"> Edit your details</g:link></li>
					</ul>
				</g:if>
				<g:else>
					<ul>
						<li><g:link controller="clinician" action="create"> Add your details</g:link></li>
					</ul>
				</g:else>

			</div>

			<div class="col-md-1">
			</div>

			<div class="col-md-1" id="rcorner2">
				<div class="center">
					<h4><i class="glyphicon glyphicon-list"></i> View  Applications</h4>
				</div>

				<br/>

				<ul>
					<li><a href ="${createLink(uri: '/ReferralRecord/filteredReferralList')}">  Your Applications List</a></li>
				</ul>

			</div>

			<div class="col-md-1">
			</div>

			<div class="col-md-1" id="rcorner3">
				<div class="center">
					<h4><i class="glyphicon glyphicon-plus" ></i> New Application</h4>
				</div>

				<br/>

				<ul>
					<li><g:link controller="referralRecord" action="create" params="['clinician.id': clinician?.id]"> Create New Application</g:link></li>
				</ul>

			</div>

		</div>
	</section>

</sec:ifAnyGranted>

</body>

</html>


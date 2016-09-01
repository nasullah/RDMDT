<%@ page import="rdmdt.ReferralStatus; rdmdt.Clinician" %>


<html>

<head>
	<title>Welcome to The Genomic Medicine Online Referral System</title>
	<meta name="layout" content="kickstart" />
	<style>
	#rcorner1 {
		border-radius: 25px;
		background: rgba(255, 240, 99, 0.09);
		border: 2px solid #8AC007;
		padding: 20px;
		width: 285px;
		height: 200px;
	}

	#rcorner2 {
		border-radius: 25px;
		background: rgba(255, 240, 99, 0.09);
		border: 2px solid #8AC007;
		padding: 20px;
		width: 285px;
		height: 200px;
	}

	#rcorner3 {
		border-radius: 25px;
		background: rgba(255, 240, 99, 0.09);
		border: 2px solid #8AC007;
		padding: 20px;
		width: 285px;
		height: 200px;
	}

	#rcorner4 {
		border-radius: 25px;
		background: rgba(255, 240, 99, 0.09);
		border: 2px solid #8AC007;
		padding: 20px;
		width: 285px;
		height: 200px;
	}

	#rcorner5 {
		border-radius: 25px;
		background: rgba(255, 240, 99, 0.09);
		border: 2px solid #8AC007;
		padding: 20px;
		width: 285px;
		height: 210px;
	}

	#rcorner6 {
		border-radius: 25px;
		background: rgba(255, 240, 99, 0.09);
		border: 2px solid #8AC007;
		padding: 20px;
		width: 285px;
		height: 210px;
	}

	#rcorner7 {
		border-radius: 25px;
		background: rgba(255, 240, 99, 0.09);
		border: 2px solid #8AC007;
		padding: 20px;
		width: 285px;
		height: 210px;
	}

	#rcorner8 {
		border-radius: 25px;
		background: rgba(255, 240, 99, 0.09);
		border: 2px solid #8AC007;
		padding: 20px;
		width: 285px;
		height: 210px;
	}
	</style>
</head>

<body>

<br/>

<br/>

<br/>

<br/>

<sec:ifAnyGranted roles="ROLE_USER">
	<section id="info">
		<div>

			<div class="col-md-1" id="rcorner1">
				<div class="center">
					<h4><i class="glyphicon glyphicon-user"></i> Your Profile</h4>
				</div>
				<br/>

				<g:if test="${clinician}">
					<ul>
						<li><g:link controller="clinician" action="show" params="[id:clinician?.id]"> View your profile</g:link></li>
					</ul>

					<ul>
						<li><g:link controller="clinician" action="edit" params="[id:clinician?.id]"> Edit your profile</g:link></li>
					</ul>
				</g:if>
				<g:else>
					<ul>
						<li><g:link controller="clinician" action="create"> Add your profile</g:link></li>
					</ul>
				</g:else>

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

			<div class="col-md-1" id="rcorner3">
				<div class="center">
					<h4><i class="glyphicon glyphicon-plus" ></i> New Application</h4>
				</div>

				<br/>

				<ul>
					<li><g:link controller="referralRecord" action="create" params="['clinician.id': clinician?.id]"> Create New Application</g:link></li>
				</ul>

			</div>

			<div class="col-md-1" id="rcorner4">
				<div class="center">
					<h4><i class="glyphicon glyphicon-list" ></i> Review Requests</h4>
				</div>

				<br/>

				<ul>
					<li><g:link controller="referralRecord" action="reviewRequestedReferralList"> View Applications</g:link></li>
				</ul>

			</div>

		</div>
	</section>

</sec:ifAnyGranted>

<sec:ifAnyGranted roles="ROLE_ADMIN">
	<section id="info">
		<div>

			<div class="col-md-1" id="rcorner5">
				<div class="center">
					<h4><i class="glyphicon glyphicon-list"></i> View Clinicians</h4>
				</div>

				<ul>
					<li class=""><a href="${createLink(uri: '/clinician/list')}"> All Clinicians</a></li>
				</ul>

			</div>

			<div class="col-md-1" id="rcorner8">
				<div class="center">
					<h4><i class="glyphicon glyphicon-list"></i> View Applications</h4>
				</div>

				<ul>
					<li class=""><a href="${createLink(uri: '/referralRecord/list')}"> All Applications</a></li>
					<li class=""><g:link controller="referralRecord" action="filteredReferralListByStatus" params="['status': ReferralStatus.findByReferralStatusName('In progress')?.id]"> In Progress </g:link></li>
					<li class=""><g:link controller="referralRecord" action="filteredReferralListByStatus" params="['status': ReferralStatus.findByReferralStatusName('Submitted')?.id]"> Submitted </g:link></li>
					<li class=""><g:link controller="referralRecord" action="filteredReferralListByStatus" params="['status': ReferralStatus.findByReferralStatusName('In Review')?.id]"> In Review </g:link></li>
					<li class=""><g:link controller="referralRecord" action="filteredReferralListByStatus" params="['status': ReferralStatus.findByReferralStatusName('Approved')?.id]"> Approved </g:link></li>
					<li class=""><g:link controller="referralRecord" action="filteredReferralListByStatus" params="['status': ReferralStatus.findByReferralStatusName('Conditional Approval')?.id]"> Conditional Approval </g:link></li>
					<li class=""><g:link controller="referralRecord" action="filteredReferralListByStatus" params="['status': ReferralStatus.findByReferralStatusName('Not Approved')?.id]"> Not Approved </g:link></li>
				</ul>

			</div>

			<div class="col-md-1" id="rcorner7">
				<div class="center">
					<h4><i class="glyphicon glyphicon-plus" ></i> New Application</h4>
				</div>

				<ul>
					<li><g:link controller="referralRecord" action="create"> Create New Application</g:link></li>
				</ul>

			</div>

			<div class="col-md-1" id="rcorner6">
				<div class="center">
					<h4><i class="glyphicon glyphicon-user"></i> User Activity</h4>
				</div>

				<ul>
					<li><a href ="${createLink(uri: '/index/listAuditLogData')}">  View User Activity Log</a></li>
				</ul>

			</div>

		</div>
	</section>

</sec:ifAnyGranted>

</body>

</html>


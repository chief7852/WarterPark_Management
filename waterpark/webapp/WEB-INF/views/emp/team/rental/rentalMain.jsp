<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--sidebar start-->

<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> Dashboard
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
					<li><i class="fa fa-laptop"></i>Dashboard</li>
				</ol>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-9 col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-flag-o red"></i><strong>Registered Users</strong>
						</h2>
					</div>
					<div class="panel-body">
						<table class="table bootstrap-datatable countries">
							<thead>
								<tr>
									<th></th>
									<th>예시</th>
									<th>예시</th>
									<th>예시</th>
									<th>예시</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!--/col-->
		</div>

		<!-- statics end -->

		<!-- project team & activity start -->
		<div class="row">
			<div class="col-md-4 portlets">
				<!-- Widget -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="pull-left">Email</div>
						<div class="clearfix"></div>
					</div>

					<div class="panel-body">
						<!-- Widget content -->
						<div class="padd sscroll"></div>
						<!-- Widget footer -->
						<div class="widget-foot">

							<form class="form-inline">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Type your message here...">
								</div>
								<button type="submit" class="btn btn-info">Send</button>
							</form>


						</div>
					</div>


				</div>
			</div>

			<div class="col-lg-8">
				<!--Project Activity start-->
				<section class="panel">
					<div class="panel-body progress-panel">
						<div class="row">
							<div class="col-lg-8 task-progress pull-left">
								<h1>To Do Everyday</h1>
							</div>
							<div class="col-lg-4">
								<span class="profile-ava pull-right"> <img alt=""
									class="simple" src="img/avatar1_small.jpg"> Jenifer smith
								</span>
							</div>
						</div>
					</div>
					<table class="table table-hover personal-task">
						<tbody>
							<tr>
								<td>Today</td>
								<td>web design</td>
								<td><span class="badge bg-important">Upload</span></td>
								<td><span class="profile-ava"> <img alt=""
										class="simple" src="img/avatar1_small.jpg">
								</span></td>
							</tr>
							<tr>
								<td>Yesterday</td>
								<td>Project Design Task</td>
								<td><span class="badge bg-success">Task</span></td>
								<td>
									<div id="work-progress2"></div>
								</td>
							</tr>
							<tr>
								<td>21-10-14</td>
								<td>Generate Invoice</td>
								<td><span class="badge bg-success">Task</span></td>
								<td>
									<div id="work-progress3"></div>
								</td>
							</tr>
							<tr>
								<td>22-10-14</td>
								<td>Project Testing</td>
								<td><span class="badge bg-primary">To-Do</span></td>
								<td><span class="profile-ava"> <img alt=""
										class="simple" src="img/avatar1_small.jpg">
								</span></td>
							</tr>
							<tr>
								<td>24-10-14</td>
								<td>Project Release Date</td>
								<td><span class="badge bg-info">Milestone</span></td>
								<td>
									<div id="work-progress4"></div>
								</td>
							</tr>
							<tr>
								<td>28-10-14</td>
								<td>Project Release Date</td>
								<td><span class="badge bg-primary">To-Do</span></td>
								<td>
									<div id="work-progress5"></div>
								</td>
							</tr>
							<tr>
								<td>Last week</td>
								<td>Project Release Date</td>
								<td><span class="badge bg-primary">To-Do</span></td>
								<td>
									<div id="work-progress1"></div>
								</td>
							</tr>
							<tr>
								<td>last month</td>
								<td>Project Release Date</td>
								<td><span class="badge bg-success">To-Do</span></td>
								<td><span class="profile-ava"> <img alt=""
										class="simple" src="img/avatar1_small.jpg">
								</span></td>
							</tr>
						</tbody>
					</table>
				</section>
				<!--Project Activity end-->
			</div>
		</div>
		<br> <br>


		<!-- project team & activity end -->

	</section>
	<div class="text-right">
		<div class="credits">
			<!--
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
          -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</div>
</section>
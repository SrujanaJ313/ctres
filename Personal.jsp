<!--   Date			 Developer    Defect     Description of change
	 --------       ----------    -------    ----------------------
	 03/13/2020      Zafrulla     ZK100329   UD-200127-Asterisk required for Capture of Primary Language 
     06/21/2021      Zafrulla     ZK132403   UD-200614-Alien Authorization Expiration Date Field Format needs correcting
     03/14/2022   	 Sathish      SAT170022  UE-220311 - Voc Rehab changes in NHUIS
     04/07/2022	     Sathish      SAT172822  UA-220407-Unable to Clone PUA Application from UI Application
     12/28/2022		 Sitaram	  SV195823	 UE-221228-MS Edge Compatibility and Alignment issues
     02/06/2023		 Sitaram	  SV198529 - UE-230131-Clear out and seek preferences on all IC unless transitional or quarterly
     07/10/2023  	 Anand   	  AnD209328	UE-230612- Work Search Enhancement Project
     04/12/2024 	 Sitaram	  SV231333	UE-240228-Login.gov Integration
-->
<!doctype html>
<%@page import="com.ssi.constant.ApplicationTypeCodes"%>
<%@ include file="/common/taglibs.jsp"%>
<fmt:bundle basename="ApplicationResources" prefix="cmtPersonalInfo.">
<html lang="en">
<head>
  <meta charset="utf-8" />
	<meta name="_csrf" content="${_csrf.token}"/>
   	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<title><fmt:message key="state"></fmt:message><fmt:message key="title"></fmt:message></title>
		
	   
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/cmtPersonalInfo.css?3"/> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/cmtPersonalInfo.js?3"></script> 
	<script src="${pageContext.request.contextPath}/scripts/jquery-ui.js"></script>
	<script>
		var alertBlock = function() {
			//alertbox
		<c:if test="${pageDTO.blockIssueExist}">
			 	document.getElementById("personalinfo-page-content").focus();
			  	$('#showBlockBox').modal('show');
			</c:if>	    	 
			};
	</script>
</head>
<body>
	<div id="personalinfo-page-content">
	<div>Test</div>
	
		<div id="headerbtns-right-new">
		    <%@ include file="../pages/commonHelpPage.jsp"%>			
		</div>
		<!-- Form and data elements -->
		<div id="pagetitle">
			<c:if test="${not empty pageDTO.sourceCd}">
			<%@ include file="../pages/titleHeader.jsp"%>
			</c:if>
			<c:if test="${empty pageDTO.sourceCd}">
				<fmt:message key="title"></fmt:message>
			</c:if>			
		</div>
		<div id="hideCmtDetailsInd" style="display: none;">${pageDTO.hideCmtDetailsInd}</div>	<!-- SV198529 -->
		<div class="formclass">
			<form:form name="cmtPersonalInfo" method="post" action="cmtPersonalInfo" modelAttribute="pageDTO">
				<c:if test="${not empty pageDTO.sourceCd}">
				<!-- Progress Bar -->
				<div>
						<%@ include file="../pages/commonProgressBarIC.jsp"%>					
				</div>
				<BR />
				<BR />
				</c:if>

				<div class="control-group">
					<BR />
					<%@ include file="../pages/commonMessages.jsp"%>
				</div>

				<!-- Personal Information -->
				<fieldset class="scheduler-border" style="margin: 0 0 0.5em 0 !important;">
					<legend class="scheduler-border" style="margin: 0 0 0.5em 0 !important;"><fmt:message key="personalInformation"></fmt:message></legend>
					<div class="control-group" id="cmtPersonalInfo">
						<!-- <table style="width: 100%;">
							<tr>
								<td width="20%">
									<label for="cmtFirstName"> <span class="star">*</span> 
										<spring:bind path="cmtFirstName">
											<span class='${status.error ? 'txtError' : ''}'>  
												<fmt:message key="firstName"></fmt:message>
											</span>
										</spring:bind>
									</label>
								</td>
								<td width="20%" class="txtFont">
									<form:input tabindex="1" id="cmtFirstName" path="cmtFirstName"
										value="${pageDTO.cmtFirstName}" maxlength="25"
										class="txt180 form-control ignoreHide" />	
								</td>
								<td width="20%">
									<label for="cmtMiddleInitial" class="notmandatory"> 
										<spring:bind path="cmtMiddleInitial">
											<span class='${status.error ? 'txtError' : ''}'>  
												<fmt:message key="middleInitial"></fmt:message>
											</span>
										</spring:bind> 
									</label>
								</td>
								<td width="3%" class="txtFont" nowrap>
									<form:input tabindex="2" id="cmtMiddleInitial" path="cmtMiddleInitial"
										value="${pageDTO.cmtMiddleInitial}" maxlength="1"
										class="txt30 form-control ignoreHide" />	
								</td>
								<td width="13%">
									<span style="padding-left:8%"></span>
									<label for="cmtLastName"><span class="star">*</span> 
										<spring:bind path="cmtLastName">
											<span class='${status.error ? 'txtError' : ''}'>  
												<fmt:message key="lastName"></fmt:message>
											</span>
										</spring:bind> 
									</label>
								</td>
								<td width="25%" class="txtFont">
									<form:input tabindex="3" id="cmtLastName" path="cmtLastName"
										value="${pageDTO.cmtLastName}" maxlength="25"
										class="txt150 form-control ignoreHide" />	
								</td>
							</tr>

							<tr>
								<td width="13%">
									<label for="cmtBirthDt"> <span class="star">*</span> 
										<spring:bind path="cmtBirthDt">
											<span class='${status.error ? 'txtError' : ''}'>  
												<fmt:message key="dob"></fmt:message>
											</span>
										</spring:bind>
									</label>
								</td>
								<td width="18%" class="txtFont" colspan="2">
									<form:input id="cmtBirthDt" tabindex="4" path="cmtBirthDt" maxlength="10"
										class="txt120 form-control fleft ignoreHide" />	
								</td>
							</tr>
							<tr>
								<td width="20%">
									<label for="idType"> <span class="star">*</span> 
										<spring:bind path="idType">
											<span class='${status.error ? 'txtError' : ''}'>  
												<fmt:message key="idType"></fmt:message>
											</span>
										</spring:bind>
									</label>
								</td>
								<td width="23%" class="txtFont">
									<form:select path="idType" 
										style="width: 160px;"  id="idType"
										value="${pageDTO.idType}" tabindex="311">
										<option value="0"><fmt:message key="selectOne"></fmt:message></option>
										<c:forEach items="${idTypeList}" var="row">
											<option value="${row.alvId}"
												<c:if test="${pageDTO.idType == row.alvId}">selected = "selected"</c:if>>
												<c:choose>
													<c:when test="${pageDTO.language == 'es_US'}">
														<c:out value="${row.alvSpShortDescTxt}"></c:out>
													</c:when>
													<c:otherwise>
														<c:out value="${row.alvShortDescTxt}"></c:out>
													</c:otherwise>
												</c:choose>
											</option>
										</c:forEach>
									</form:select>
								</td>
								<td width="10%">
									<label for="idNumber" class="notmandatory"> 
										<spring:bind path="idNumber">
											<span class='${status.error ? 'txtError' : ''}'>  
												<fmt:message key="idNumber"></fmt:message>
											</span>
										</spring:bind> 
									</label>
								</td>
								<td width="10%" class="txtFont">
									<form:input tabindex="3" id="idNumber" path="idNumber"
										value="${pageDTO.idNumber}" maxlength="16"
										class="txt120 form-control" />
								</td>
								<td width="18%"> 
									<label for="idIssuedState">&nbsp; 
										<fmt:message key="issuedState"></fmt:message>
									</label>
								</td>
								<td width="19%" class="txtFont" > 
									<form:select path="idIssuedState" style="font:normal 12px calibri; width:62px;"  id="idIssuedState"
										value="${pageDTO.idIssuedState}" tabindex="311">
									
										<option value="">--</option>  
										<c:forEach items="${usStateCodes}" var="row">
									        <option value ="${row.label}" <c:if test="${pageDTO.idIssuedState == row.label}">selected = "selected"</c:if>>
									        <c:out value="${row.label}"></c:out></option>
									 	</c:forEach> 
									</form:select>
								</td>
							</tr>
						</table> -->
						<div class="form-row">
							<div class="form-group">
							  <label for="cmtFirstName">
								<span class="star">*</span> 
								<spring:bind path="cmtFirstName">
								  <span class='${status.error ? 'txtError' : ''}'>  
									<fmt:message key="firstName"></fmt:message>
								  </span>
								</spring:bind>
							  </label>
							  <form:input tabindex="1" id="cmtFirstName" path="cmtFirstName"
								value="${pageDTO.cmtFirstName}" maxlength="25"
								class="form-control" />
							</div>
						  
							<div class="form-group">
							  <label for="cmtMiddleInitial" class="notmandatory"> 
								<spring:bind path="cmtMiddleInitial">
								  <span class='${status.error ? 'txtError' : ''}'>  
									<fmt:message key="middleInitial"></fmt:message>
								  </span>
								</spring:bind> 
							  </label>
							  <form:input tabindex="2" id="cmtMiddleInitial" path="cmtMiddleInitial"
								value="${pageDTO.cmtMiddleInitial}" maxlength="1"
								class="form-control middle-initial" />
							</div>
						  
							<div class="form-group">
							  <label for="cmtLastName"><span class="star">*</span> 
								<spring:bind path="cmtLastName">
								  <span class='${status.error ? 'txtError' : ''}'>  
									<fmt:message key="lastName"></fmt:message>
								  </span>
								</spring:bind> 
							  </label>
							  <form:input tabindex="3" id="cmtLastName" path="cmtLastName"
								value="${pageDTO.cmtLastName}" maxlength="25"
								class="form-control" />
							</div>
						  </div>
						  
						  <div class="form-group">
							  <label for="cmtBirthDt"> <span class="star">*</span> 
								<spring:bind path="cmtBirthDt">
								  <span class='${status.error ? 'txtError' : ''}'>  
									<fmt:message key="dob"></fmt:message>
								  </span>
								</spring:bind>
							  </label>

								  <form:input tabindex="4" path="cmtBirthDt" maxlength="10"
									class="txt120 form-control fleft ignoreHide" />

						  </div>
						  
						  <div class="form-row">
							<!-- ID Type Field -->
							<div class="form-group">
							  <label for="idType">
								<span class="star">*</span> 
								<spring:bind path="idType">
								  <span class='${status.error ? 'txtError' : ''}'>  
									<fmt:message key="idType"></fmt:message>
								  </span>
								</spring:bind>
							  </label>
							  <form:select path="idType" id="idType"
								value="${pageDTO.idType}" tabindex="311" class="form-control">
								<option value="0"><fmt:message key="selectOne"></fmt:message></option>
								<c:forEach items="${idTypeList}" var="row">
								  <option value="${row.alvId}"
									<c:if test="${pageDTO.idType == row.alvId}">selected = "selected"</c:if>>
									<c:choose>
									  <c:when test="${pageDTO.language == 'es_US'}">
										<c:out value="${row.alvSpShortDescTxt}"></c:out>
									  </c:when>
									  <c:otherwise>
										<c:out value="${row.alvShortDescTxt}"></c:out>
									  </c:otherwise>
									</c:choose>
								  </option>
								</c:forEach>
							  </form:select>
							</div>
						  
							<!-- ID Number Field -->
							<div class="form-group">
							  <label for="idNumber" class="notmandatory"> 
								<spring:bind path="idNumber">
								  <span class='${status.error ? 'txtError' : ''}'>  
									<fmt:message key="idNumber"></fmt:message>
								  </span>
								</spring:bind> 
							  </label>
							  <form:input tabindex="3" id="idNumber" path="idNumber"
								value="${pageDTO.idNumber}" maxlength="16"
								class="form-control" />
							</div>
						  
							<!-- Issued State Field -->
							<div class="form-group">
							  <label for="idIssuedState">
								<fmt:message key="issuedState"></fmt:message>
							  </label>
							  <form:select path="idIssuedState" id="idIssuedState"
								value="${pageDTO.idIssuedState}" tabindex="311" class="form-control state-select">
								<option value="">--</option>  
								<c:forEach items="${usStateCodes}" var="row">
								  <option value="${row.label}" <c:if test="${pageDTO.idIssuedState == row.label}">selected = "selected"</c:if>>
									<c:out value="${row.label}"></c:out>
								  </option>
								</c:forEach> 
							  </form:select>
							</div>
						  </div>
					</div>
				</fieldset>


				<!-- Residential Address -->
				<fieldset class="scheduler-border" style="margin: 0 0 0.5em 0 !important;">
					<legend class="scheduler-border" style="margin: 0 0 0.5em 0 !important;">
						<fmt:message key="residentialAddress"></fmt:message> 
					</legend>
					<div class="control-group" id="personalInfoResidentialAddress">
						<c:set var="physicalTabIndex" value="5" />
						<c:set var="displayaddrline3" value="false" />
						<%@ include file="../pages/physicalAddress.jsp"%>
					</div>
				</fieldset>


				<!-- Mailing address -->
				<label class="hidden" for="chkCopyPhysicalAddress"><fmt:message key="mailingAddressMsg"/></label>	
				<fieldset class="scheduler-border" style="margin: 0 0 0.5em 0 !important;">
					<legend class="scheduler-border" style="margin: 0 0 0.5em 0 !important;">
						<input tabindex="85" type="checkbox" name="personalInfoMailingAddress" id="chkCopyPhysicalAddress"> 
						<span class="scheduler-border"> <fmt:message key="mailingAddressMsg"></fmt:message></span>
					</legend>
					<div class="control-group">
						<table>
							<c:set var="regularTabIndex" value="100" />
							<c:set var="displayaddrline3" value="false" />
							<%@ include file="../pages/commonAddress.jsp"%>
						</table>
					</div>
				</fieldset>


				<!-- Demographics -->
				<fieldset class="scheduler-border" style="margin: 0 0 0.5em 0 !important;">
					<legend class="scheduler-border" style="margin: 0 0 0.5em 0 !important;">
						<span class="scheduler-border"><fmt:message key="demographics"></fmt:message></span>
					</legend>
					
					<div class="control-group" id="demographicsInfo">
						
						<!-- Gender and Ethnicity -->
						<table>
							<tr>
								<td width="10%" class="rowht" style="padding-top: -50px;">
									<label for="gender"><span class="star">*</span>
										<spring:bind path="cmtGender">
											<span class='${status.error ? 'txtError' : ''}'>  
												<fmt:message key="gender"></fmt:message>
											</span>
										</spring:bind>
									</label>
								</td>
								<td width="40%" style="padding-bottom: 1%; padding-left: 0.5%;">
									<label class="hidden" for="cmtGender1"><fmt:message key="male"/></label>
									<form:radiobutton tabindex="301" path="cmtGender" value="<%=ApplicationTypeCodes.CMT_GENDER_MALE %>" /> 
									<fmt:message key="male"></fmt:message>&nbsp;
									<label class="hidden" for="cmtGender2"><fmt:message key="female"/></label>
									<form:radiobutton tabindex="302" path="cmtGender" value="<%=ApplicationTypeCodes.CMT_GENDER_FEMALE %>" /> 
									<fmt:message key="female"></fmt:message>&nbsp; 
									<label class="hidden" for="cmtGender3"><fmt:message key="chooseNoAnswer"/></label>
									<form:radiobutton tabindex="303" path="cmtGender" value="<%=ApplicationTypeCodes.CMT_GENDER_CHOOSE_NOT_TO_ANSWER %>" /> 
									<fmt:message key="chooseNoAnswer"></fmt:message>
								</td>

								<td width="15%" class="rowht">
									<label for="cmtEthnicity">&nbsp;<span class="star">*</span>&nbsp;
											<spring:bind path="cmtEthnicity">
												<span class='${status.error ? 'txtError' : ''}'>  
													<fmt:message key="ethnicity"></fmt:message>
												</span>
											</spring:bind> 
									</label>
								</td>
								<td width="25%" class="rowht">
									&nbsp;<form:select tabindex="304"  style="width:75%;" path="cmtEthnicity" id="cmtEthnicity" value="${pageDTO.cmtEthnicity}">
										<option value=""><fmt:message key="selectOne"></fmt:message></option>
										<c:forEach items="${ethnicityList}" var="row">
											<option value="${row.alvId}"
												<c:if test="${pageDTO.cmtEthnicity == row.alvId}">selected = "selected"</c:if>>
													<c:choose>
														<c:when test="${pageDTO.language == 'es_US'}">
															<c:out value="${row.alvSpShortDescTxt}"></c:out>
														</c:when>
														<c:otherwise>
															<c:out value="${row.alvShortDescTxt}"></c:out>
														</c:otherwise>
													</c:choose>
											</option>
										</c:forEach>
									</form:select>
								</td>
							</tr>
						</table>

						<!-- Race -->	
						<table>
							<tr>
								<td width="11%" class="rowht">
									<label for="cmtRaceCode"><span class="star">*</span>
										<spring:bind path="cmtRaceCode">
											<span class='${status.error ? 'txtError' : ''}'>  
												<fmt:message key="race"></fmt:message>
											</span>
										</spring:bind>	
									</label>
												
								</td>
								<td class="rowht txtblk" width="48%">
									<label class="hidden" for="cmtRaceAmericanIndian"><fmt:message key="raceNative"/></label>
									<form:checkbox tabindex="305" id="cmtRaceAmericanIndian"
										path="cmtRaceAmericanIndian" value="1"
										cssStyle="vertical-align:middle;position:relative;bottom:2.5px;" />
										&nbsp;<fmt:message key="raceNative"></fmt:message>
								</td>
								<td width="16%" class="txtblk">
									<label class="hidden" for="cmtRaceWhite"><fmt:message key="white"/></label>
									<form:checkbox tabindex="306" id="cmtRaceWhite" path="cmtRaceWhite" value="1"
										cssStyle="vertical-align:middle;position:relative;bottom:2.5px;" />
										&nbsp;<fmt:message key="white"></fmt:message>
								</td>
								<td width="33%" class="txtblk">
									<label class="hidden" for="cmtRaceBlackAfricanAmerican"><fmt:message key="raceBlack"/></label>
									<form:checkbox tabindex="307" id="cmtRaceBlackAfricanAmerican"
										path="cmtRaceBlackAfricanAmerican" value="1"
										cssStyle="vertical-align:middle;position:relative;bottom:2.5px;" />
										&nbsp;<fmt:message key="raceBlack"></fmt:message>
								</td>
							</tr>

							<tr>
								<td width="11%" class="rowht"></td>
								<td class="rowht txtblk" width="45%">
									<label class="hidden" for="cmtRaceNativeHawaiian"><fmt:message key="raceIslander"/></label>	
									<form:checkbox tabindex="308" id="cmtRaceNativeHawaiian"
										path="cmtRaceNativeHawaiian" value="1"
										cssStyle="vertical-align:middle;position:relative;bottom:2.5px;" />
										&nbsp;<fmt:message key="raceIslander"></fmt:message>
								</td>
								<td width="16%" class="txtblk">
									<label class="hidden" for="cmtRaceAsian"><fmt:message key="raceAsian"/></label>
									<form:checkbox tabindex="309" id="cmtRaceAsian" path="cmtRaceAsian" value="1"
										cssStyle="vertical-align:middle;position:relative;bottom:2.5px;" />
										&nbsp;<fmt:message key="raceAsian"></fmt:message>
								</td>
								<td width="33%" class="txtblk">
									<label class="hidden" for="cmtRaceChooseNotToAnswer"><fmt:message key="chooseNoAnswer"/></label>
									<form:checkbox tabindex="310" id="cmtRaceChooseNotToAnswer"
										path="cmtRaceChooseNotToAnswer" value="1" cssStyle="vertical-align:middle;position:relative;bottom:2.5px;" />
										&nbsp;<fmt:message key="chooseNoAnswer"></fmt:message>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>

							<!-- Education Level -->
							<tr>
								<td width="11%" class="rowht" colspan="4">
									<label for="cmtEducationLevel"><span class="star">*</span> 
										<spring:bind path="cmtEducationLevel">
											<span class='${status.error ? 'txtError' : ''}'>  
												<fmt:message key="educationLevel"></fmt:message>
											</span>
										</spring:bind>
									</label> 
									<span style="padding-left: 25.5%;"></span> 
									<form:select path="cmtEducationLevel" 
										style="width: 395px;"  id="cmtEducationLevel"
										value="${pageDTO.cmtEducationLevel}" tabindex="311">
										<option value=""><fmt:message key="selectOne"></fmt:message></option>
										<c:forEach items="${educationList}" var="row">
											<option value="${row.alvId}"
												<c:if test="${pageDTO.cmtEducationLevel == row.alvId}">selected = "selected"</c:if>>
												<c:choose>
													<c:when test="${pageDTO.language == 'es_US'}">
														<c:out value="${row.alvSpShortDescTxt}"></c:out>
													</c:when>
													<c:otherwise>
														<c:out value="${row.alvShortDescTxt}"></c:out>
													</c:otherwise>
												</c:choose>
											</option>
										</c:forEach>
									</form:select>
								</td>
							</tr>
							
							<!-- Specialty Occupation --> <!-- AnD209328 starts -->
							<tr>
								<td width="11%" class="rowht" colspan="4">
									<label for="cmtSplOccupationCd"><span class="star">*</span> 
										<spring:bind path="cmtSplOccupationCd">
											<span class='${status.error ? 'txtError' : ''}'>  
												<fmt:message key="splOccupation"></fmt:message>
											</span>
										</spring:bind>
									</label>
									<c:choose>
										<c:when test="${pageDTO.language == 'en_US'}">
											<span style="padding-left: 20.8%;"></span> 
										</c:when>
										<c:otherwise>
											<span style="padding-left: 18%;"></span> 
										</c:otherwise>
									</c:choose>
										<form:select tabindex="312" style="width: 395px;"  id="cmtSplOccupationCd" 
											path="cmtSplOccupationCd" value="${pageDTO.cmtSplOccupationCd}">
											<option value=""><fmt:message key="selectOne"></fmt:message></option>
											<c:forEach items="${splOccupationList}" var="row">
												<option value="${row.alvId}"
													<c:if test="${pageDTO.cmtSplOccupationCd == row.alvId}">selected = "selected"</c:if>>
														<c:choose>
															<c:when test="${pageDTO.language == 'es_US'}">
																<c:out value="${row.alvSpShortDescTxt}"></c:out>
															</c:when>
															<c:otherwise>
																<c:out value="${row.alvShortDescTxt}"></c:out>
															</c:otherwise>
														</c:choose>
												</option>
											</c:forEach>
									</form:select>
								</td>
							</tr>
							<!-- AnD209328 ends -->							
						</table>
					</div>
					
					<!-- Language Question --><%--AD63725 starts --%>
					<p>
						<span class="star">*</span> <span class="txtblu"> 
							<spring:bind path="cmtPrimaryLanguage">
								<span class='${status.error ? 'txtError' : ''}'>  
									<fmt:message key="languageQues1"></fmt:message>
								</span>
							</spring:bind>
						</span>
						<span style="padding-left: 5%"></span>
						<label class="hidden" for="cmtPrimaryLanguage1"><fmt:message key="english"/></label>
						<form:radiobutton tabindex="313" path="cmtPrimaryLanguage"  value="E" />
							<span class="txtblk">&nbsp;<fmt:message key="english"></fmt:message></span> &nbsp;
						<label class="hidden" for="cmtPrimaryLanguage2"><fmt:message key="other"/></label>
						<form:radiobutton tabindex="314" path="cmtPrimaryLanguage"  value="O" />
							<span class="txtblk">&nbsp;<fmt:message key="other"></fmt:message></span> &nbsp;
						<label class="hidden" for="cmtPrimaryLanguage3"><fmt:message key="languageDropDown"/></label>
							<span class="txtblk">&nbsp;
							<spring:bind path="cmtOtherPrimaryLanguage">
								<span class='${status.error ? 'txtError' : ''}'>  
									<fmt:message key="languageDropDown"></fmt:message>
								</span>
							</spring:bind>
							</span>
							<form:select path="cmtOtherPrimaryLanguage" style="width: 200px;margin: 0.5em 0 0 0"
								id="cmtOtherPrimaryLanguage"
								value="${pageDTO.cmtOtherPrimaryLanguage}" tabindex="315">
								<option value=""><fmt:message key="selectOne"></fmt:message></option>
								<c:forEach items="${otherLanguages}" var="row">
									<option value="${row.value}"
										<c:if test="${pageDTO.cmtOtherPrimaryLanguage == row.value}">selected = "selected"</c:if>>
										<c:out value="${row.label}"></c:out></option>
								</c:forEach>
							</form:select>
					</p>
					<p><span class="star">*</span><!--ZK100329 -->
   						  <span class="txtblu"> <!--ZK100329 -->
					 		<spring:bind path="cmtPrimaryLanguageSkill">
								<span class='${status.error ? 'txtError' : ''}'>  
									<fmt:message key="languageQues2"></fmt:message>
								</span>
							</spring:bind>
						</span>
					<label class="hidden" for="cmtPrimaryLanguageSkill"><fmt:message key="languageQues2"/></label>
								<span class="txtblk">&nbsp;</span>
								
						<label class="hidden" for="cmtLangSkillRead"><fmt:message
								key="languageRead" /></label>
						<form:checkbox tabindex="316" id="cmtLangSkillRead"
							path="cmtLangSkillRead" value="R" cssStyle="vertical-align:middle;position:relative;bottom:2.5px;"
							/>&nbsp;<fmt:message
								key="languageRead" />
						&nbsp;
						<label class="hidden" for="cmtLangSkillWrite"><fmt:message
								key="languageWrite" /></label>
						<form:checkbox tabindex="317" id="cmtLangSkillWrite"
							path="cmtLangSkillWrite" value="W" cssStyle="vertical-align:middle;position:relative;bottom:2.5px;"
							 />&nbsp;<fmt:message
								key="languageWrite" />
						&nbsp;
						<label class="hidden" for="cmtLangSkillSpeak"><fmt:message
								key="languageSpeak" /></label>
						<form:checkbox tabindex="318" id="cmtLangSkillSpeak"
							path="cmtLangSkillSpeak" value="S" cssStyle="vertical-align:middle;position:relative;bottom:2.5px;"
							 />&nbsp;<fmt:message
								key="languageSpeak" />
						&nbsp;
					</p>
					<%--AD63725 ends --%>
					<!-- high School graduation -->
					<table>
						
						<tr>
								<td class="rowht txtblk" width="55%">
									<label for="highSchoolGradYr"><span class="star">*</span> 
										<spring:bind path="cmtHighSchoolGradYr">
											<span class='${status.error ? 'txtError' : ''}'>  
												<fmt:message key="highSchoolGradYr"></fmt:message>
											</span>
										</spring:bind>
									</label>
								</td>
								<td class="rowht txtblk" width="20%">
									<form:input id="cmtHighSchoolGradYr" tabindex="319" path="cmtHighSchoolGradYr" maxlength="4"
										class="txt80 form-control fleft numeric" />
								</td>
								<td class="rowht txtblk" width="25%">
									<form:checkbox tabindex="320" id="cmtHighSchoolGradYrNA"
										path="cmtHighSchoolGradYrNA" value="9999" />
										&nbsp;<fmt:message key="chooseNoAnswer"></fmt:message>
								</td>
							</tr>
					</table>
					
					
					<!-- U.S Citizen -->
					<p>
						<span class="star">*</span> 
							<span class="txtblu"> 
								<spring:bind path="cmtCitizenInd">
									<span class='${status.error ? 'txtError' : ''}'>  
										<fmt:message key="citizenQuesMsg"></fmt:message>
									</span>
								</spring:bind>
							</span>
						<span style="padding-left: 5%"></span>
						<label class="hidden" for="cmtCitizenInd1"><fmt:message key="yes"/></label>
						<form:radiobutton tabindex="321" path="cmtCitizenInd" id="cmtCitizenInd1" value="Y" />
							<span class="txtblk">&nbsp;<fmt:message key="yes"></fmt:message></span> &nbsp;
						<label class="hidden" for="cmtCitizenInd2"><fmt:message key="no"/></label>
						<form:radiobutton tabindex="322" path="cmtCitizenInd" id="cmtCitizenInd2" value="N" />
							<span class="txtblk">&nbsp;<fmt:message key="no"></fmt:message></span>
					</p>

					<!-- Alien Type -->
					<div class="control-group" id="alienInfo">
						<table width="100%">
							<!-- Type of Authorization (Alien Type) -->
							<tr>
								<td width="2%" class="rowht"></td>
								<td width="38%" class="rowht">
									<label for="cmtAlienType"  class="notmandatory">
										<spring:bind path="cmtAlienType">
											<span class='${status.error ? 'txtError' : ''}'>   
												<fmt:message key="workAuthorizationQuesMsg"></fmt:message>
											</span>
										</spring:bind>
									</label>
								</td>
								<td width="50%" class="rowht"> 
										<form:select tabindex="323" style="width: 98.5%" id="cmtAlienType" 
											path="cmtAlienType" value="${pageDTO.cmtAlienType}">
											<option value=""><fmt:message key="selectOne"></fmt:message></option>
											<c:forEach items="${alienTypeList}" var="row">
												<option value="${row.alvId}"
													<c:if test="${pageDTO.cmtAlienType == row.alvId}">selected = "selected"</c:if>>
														<c:choose>
															<c:when test="${pageDTO.language == 'es_US'}">
																<c:out value="${row.alvSpShortDescTxt}"></c:out>
															</c:when>
															<c:otherwise>
																<c:out value="${row.alvShortDescTxt}"></c:out>
															</c:otherwise>
														</c:choose>
												</option>
											</c:forEach>
									</form:select>
								</td>
							</tr>
							
							<!-- Alien Authorization # and Expiration Date -->
							<tr>
								<td width="2%" class="rowht"></td>
								<td width="38%" class="rowht">
									<label for="cmtAlienNumber" class="notmandatory">
										<spring:bind path="cmtAlienNumber">
											<span class='${status.error ? 'txtError' : ''}'>   
												<fmt:message key="aaNumber"></fmt:message>
											</span>
										</spring:bind> 
									</label> 
								</td>
								<td width="50%" class="rowht">
									<form:input tabindex="324" id="cmtAlienNumber" path="cmtAlienNumber"
										value="${pageDTO.cmtAlienNumber}" maxlength="11" class="txt120 form-control" />
										<label for="dbaName" class="notmandatory">
										<spring:bind path="cmtAlienExpireDate">
											<span class='${status.error ? 'txtError' : ''}'>   
												<fmt:message key="expirationDate"></fmt:message>
											</span>
										</spring:bind>
									</label>
									<span style="padding-left: 4%"></span>
									<form:input tabindex="325" id="cmtAlienExpireDate" path="cmtAlienExpireDate"
										value="${pageDTO.cmtAlienExpireDate}" maxlength="10" class="txt80 form-control" /><!--ZK132403 removed numeric-->
								</td>
							</tr>
						</table>
					</div>
					
					
					<!-- Disability -->
					<p>
						<span class="star">*</span> <span class="txtblu"> 
							<spring:bind path="cmtDisability">
								<span class='${status.error ? 'txtError' : ''}'>  
									<fmt:message key="disabledQuestion"></fmt:message>
								</span>
							</spring:bind>
						</span>
						<span style="padding-left: 7.9%"></span>
						<label class="hidden" for="cmtDisability1"><fmt:message key="yes"/></label>
						<form:radiobutton tabindex="326" path="cmtDisability"  value="<%= ApplicationTypeCodes.CMT_DISABILITY_YES %>" />
							<span class="txtblk">&nbsp;<fmt:message key="yes"></fmt:message></span> &nbsp;
						<label class="hidden" for="cmtDisability2"><fmt:message key="no"/></label>
						<form:radiobutton tabindex="327" path="cmtDisability"  value="<%= ApplicationTypeCodes.CMT_DISABILITY_NO %>" />
							<span class="txtblk">&nbsp;<fmt:message key="no"></fmt:message></span> &nbsp;
						<label class="hidden" for="cmtDisability3"><fmt:message key="chooseNoAnswer"/></label>
						<form:radiobutton tabindex="328" path="cmtDisability"  value="<%= ApplicationTypeCodes.CMT_DISABILITY_NO_ANSWER %>" />
							<span class="txtblk">&nbsp;<fmt:message key="chooseNoAnswer"></fmt:message></span>
					</p>
					
					
					<!-- SAT170022 Starts -->
					<!-- Voc Rehab --> <!-- SAT172822 -->
					<c:if test="${pageDTO.sourceCd eq '4184' && pageDTO.capFilingProgCd eq '64'}">
					<p>
					   <fmt:message key="vocRehabDisplay"></fmt:message>
					</p>
					<p>
						<span class="star">*</span> <span class="txtblu"> 
							<spring:bind path="cmtClxVrServInd">
								<span class='${status.error ? 'txtError' : ''}'>  
									<fmt:message key="vocRehabQuestion"></fmt:message>
								</span>
							</spring:bind>
						</span>
						<span style="padding-left: 7.9%"></span>
						<label class="hidden" for="cmtClxVrServInd1"><fmt:message key="yes"/></label>
						<form:radiobutton tabindex="329" path="cmtClxVrServInd"  value="Y" />
							<span class="txtblk">&nbsp;<fmt:message key="yes"></fmt:message></span> &nbsp;
						<label class="hidden" for="cmtClxVrServInd2"><fmt:message key="no"/></label>
						<form:radiobutton tabindex="330" path="cmtClxVrServInd"  value="N" />
							<span class="txtblk">&nbsp;<fmt:message key="no"></fmt:message></span> &nbsp;						
					</p>
					</c:if>
					<!-- SAT170022 Ends -->
										
				</fieldset>

				<div class="btmbtns" style="padding-left: 25px; padding-right: 25px;">
				<button type="submit" tabindex="331" class="btn btn-primary" name="cancel" value="Cancel" data-toggle="modal" data-target="#showCancelConfirmation" >
					<fmt:message key="cancel"></fmt:message></button>
				<span class="fright">
					<c:if test="${empty pageDTO.sourceCd}">
					<button type="submit" tabindex="332" class="btn btn-primary" name="Next" value="Save"><fmt:message key="save"></fmt:message></button>
					</c:if>
					<c:if test="${not empty pageDTO.sourceCd}">
					<button type="submit" tabindex="333" class="btn btn-primary" name="Next" value="Next"><fmt:message key="next"></fmt:message></button>
					</c:if>
				</span>
				</div>
				<form:hidden path="cmtSpdStatusCd" id="cmtSpdStatusCd" value="${pageDTO.cmtSpdStatusCd}"/>
				<form:hidden path="ssnVerifyCd" id="ssnVerifyCd" value="${pageDTO.ssnVerifyCd}"/>
				<form:hidden path="ssnReasonCd" id="ssnReasonCd" value="${pageDTO.ssnReasonCd}"/>
				<form:hidden path="cmtCitizenIndTemp" id="cmtCitizenIndTemp" value="${pageDTO.cmtCitizenIndTemp}"/>
				<form:hidden path="cmtPersonalInfoChanged" id="cmtPersonalInfoChanged" value="${pageDTO.cmtPersonalInfoChanged}"/>
				<form:hidden path="addressDTO.activePhysicalAddressExists" id="activePhysicalAddressExists" value="${pageDTO.addressDTO.activePhysicalAddressExists}"/>
				<form:hidden path="addressDTO.activeAddressExists" id="activeAddressExists" value="${pageDTO.addressDTO.activeAddressExists}"/>
				<form:hidden path="addressDTO.physicalAddressId" id="physicalAddressId" value="${pageDTO.addressDTO.physicalAddressId}"/>
				<form:hidden path="addressDTO.addressId" id="addressId" value="${pageDTO.addressDTO.addressId}"/> 
				<form:hidden path="cmtBirthDtExist" id="cmtBirthDtExist" value="${pageDTO.cmtBirthDtExist}"/>
				<form:hidden path="enableDOB" id="enableDOB" value="${pageDTO.enableDOB}"/> <!-- SV231333 -->
				<form:hidden path="cmtHighSchoolGradYrNATemp" id="cmtHighSchoolGradYrNATemp" value="${pageDTO.cmtHighSchoolGradYrNATemp}"/>
			<div class="modal fade" id="cmtPersonalInfoChangedModal">
			  <div class="modal-dialog" style="position:absolute; top:200px; left:400px;">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="btn fright" data-dismiss="modal" aria-hidden="true">x</button>
			        <h4 class="modal-title"><fmt:message key="perInfoChangeConfirmation"></fmt:message></h4>
			      </div>
			      <div class="modal-body">
			        <p><fmt:message key="infoModifiedConfirmMsg"></fmt:message></p>
			      </div>
			      <div class="modal-footer">
			         <div class="btmbtns" style="padding-left:25px; padding-right:25px;">
				        <span class="fleft"><button type="submit" name="Y" tabindex="2" class="btn btn-default" value="Y">
							<fmt:message key="yes"></fmt:message></button></span>
				        <button type="button" class="btn btn-primary" tabindex="1" data-dismiss="modal" value="N">
						 	<fmt:message key="no"></fmt:message></button>
			        </div>
			      </div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			
			 <%@ include file="../pages/cancelButtonConfirm.jsp"%>
			<%@ include file="../pages/blockModal.jsp"%>
			</form:form>
		</div>
	</div>
</body>
</html>
</fmt:bundle>
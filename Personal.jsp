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
						  
						  <div class="form-row">
							<div class="form-col-13">
							  <label for="cmtBirthDt"> <span class="star">*</span> 
								<spring:bind path="cmtBirthDt">
								  <span class='${status.error ? 'txtError' : ''}'>  
									<fmt:message key="dob"></fmt:message>
								  </span>
								</spring:bind>
							  </label>
							</div>
							<div class="form-col-18 txtFont" colspan="2">
							  <form:input id="cmtBirthDt" tabindex="4" path="cmtBirthDt" maxlength="10"
								class="txt120 form-control fleft ignoreHide" />
							</div>
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
						<span class="scheduler-border"><fmt:message key="demographics"/></span>
					</legend>
					
					<div class="demographics-group" id="demographicsInfo">
						<!-- Gender and Ethnicity -->
						<div class="demographics-form-row">
							<div class="gender-group">
								<label for="gender"><span class="star">*</span>
									<spring:bind path="cmtGender">
										<span class='${status.error ? "txtError" : ""}'>  
											<fmt:message key="gender"/>
										</span>
									</spring:bind>
								</label>
								<div class="radio-group">
									<label class="radio-option">
										<form:radiobutton tabindex="301" path="cmtGender" value="<%=ApplicationTypeCodes.CMT_GENDER_MALE %>" id="cmtGender1"/>
										<fmt:message key="male"/>
									</label>
									<label class="radio-option">
										<form:radiobutton tabindex="302" path="cmtGender" value="<%=ApplicationTypeCodes.CMT_GENDER_FEMALE %>" id="cmtGender2"/>
										<fmt:message key="female"/>
									</label>
									<label class="radio-option">
										<form:radiobutton tabindex="303" path="cmtGender" value="<%=ApplicationTypeCodes.CMT_GENDER_CHOOSE_NOT_TO_ANSWER %>" id="cmtGender3"/>
										<fmt:message key="chooseNoAnswer"/>
									</label>
								</div>
							</div>
				
							<div class="ethnicity-group">
								<label for="cmtEthnicity">&nbsp;<span class="star">*</span>&nbsp;
									<spring:bind path="cmtEthnicity">
										<span class='${status.error ? "txtError" : ""}'>  
											<fmt:message key="ethnicity"/>
										</span>
									</spring:bind> 
								</label>
								<form:select tabindex="304" path="cmtEthnicity" id="cmtEthnicity" value="${pageDTO.cmtEthnicity}" class="form-control">
									<option value=""><fmt:message key="selectOne"/></option>
									<c:forEach items="${ethnicityList}" var="row">
										<option value="${row.alvId}" <c:if test="${pageDTO.cmtEthnicity == row.alvId}">selected="selected"</c:if>>
											<c:choose>
												<c:when test="${pageDTO.language == 'es_US'}">
													<c:out value="${row.alvSpShortDescTxt}"/>
												</c:when>
												<c:otherwise>
													<c:out value="${row.alvShortDescTxt}"/>
												</c:otherwise>
											</c:choose>
										</option>
									</c:forEach>
								</form:select>
							</div>
						</div>
				
						<!-- Race -->
						<div class="form-row race-row">
							<div class="form-group race-label">
								<label for="cmtRaceCode"><span class="star">*</span>
									<spring:bind path="cmtRaceCode">
										<span class='${status.error ? "txtError" : ""}'>  
											<fmt:message key="race"/>
										</span>
									</spring:bind>    
								</label>
							</div>
							
							<div class="race-options">
								<div class="race-option-group">
									<label class="checkbox-option">
										<form:checkbox tabindex="305" id="cmtRaceAmericanIndian" path="cmtRaceAmericanIndian" value="1"/>
										<fmt:message key="raceNative"/>
									</label>
									<label class="checkbox-option">
										<form:checkbox tabindex="306" id="cmtRaceWhite" path="cmtRaceWhite" value="1"/>
										<fmt:message key="white"/>
									</label>
									<label class="checkbox-option">
										<form:checkbox tabindex="307" id="cmtRaceBlackAfricanAmerican" path="cmtRaceBlackAfricanAmerican" value="1"/>
										<fmt:message key="raceBlack"/>
									</label>
								</div>
								
								<div class="race-option-group">
									<label class="checkbox-option">
										<form:checkbox tabindex="308" id="cmtRaceNativeHawaiian" path="cmtRaceNativeHawaiian" value="1"/>
										<fmt:message key="raceIslander"/>
									</label>
									<label class="checkbox-option">
										<form:checkbox tabindex="309" id="cmtRaceAsian" path="cmtRaceAsian" value="1"/>
										<fmt:message key="raceAsian"/>
									</label>
									<label class="checkbox-option">
										<form:checkbox tabindex="310" id="cmtRaceChooseNotToAnswer" path="cmtRaceChooseNotToAnswer" value="1"/>
										<fmt:message key="chooseNoAnswer"/>
									</label>
								</div>
							</div>
						</div>
				
						<!-- Education Level -->
						<div class="form-row education-row">
							<div class="form-group education-group">
								<label for="cmtEducationLevel"><span class="star">*</span> 
									<spring:bind path="cmtEducationLevel">
										<span class='${status.error ? "txtError" : ""}'>  
											<fmt:message key="educationLevel"/>
										</span>
									</spring:bind>
								</label>
								<form:select path="cmtEducationLevel" id="cmtEducationLevel" value="${pageDTO.cmtEducationLevel}" tabindex="311" class="form-control">
									<option value=""><fmt:message key="selectOne"/></option>
									<c:forEach items="${educationList}" var="row">
										<option value="${row.alvId}" <c:if test="${pageDTO.cmtEducationLevel == row.alvId}">selected="selected"</c:if>>
											<c:choose>
												<c:when test="${pageDTO.language == 'es_US'}">
													<c:out value="${row.alvSpShortDescTxt}"/>
												</c:when>
												<c:otherwise>
													<c:out value="${row.alvShortDescTxt}"/>
												</c:otherwise>
											</c:choose>
										</option>
									</c:forEach>
								</form:select>
							</div>
						</div>
						
						<!-- Specialty Occupation -->
						<div class="form-row occupation-row">
							<div class="form-group occupation-group">
								<label for="cmtSplOccupationCd"><span class="star">*</span> 
									<spring:bind path="cmtSplOccupationCd">
										<span class='${status.error ? "txtError" : ""}'>  
											<fmt:message key="splOccupation"/>
										</span>
									</spring:bind>
								</label>
								<form:select tabindex="312" id="cmtSplOccupationCd" path="cmtSplOccupationCd" value="${pageDTO.cmtSplOccupationCd}" class="form-control">
									<option value=""><fmt:message key="selectOne"/></option>
									<c:forEach items="${splOccupationList}" var="row">
										<option value="${row.alvId}" <c:if test="${pageDTO.cmtSplOccupationCd == row.alvId}">selected="selected"</c:if>>
											<c:choose>
												<c:when test="${pageDTO.language == 'es_US'}">
													<c:out value="${row.alvSpShortDescTxt}"/>
												</c:when>
												<c:otherwise>
													<c:out value="${row.alvShortDescTxt}"/>
												</c:otherwise>
											</c:choose>
										</option>
									</c:forEach>
								</form:select>
							</div>
						</div>
						
						<!-- Language Question -->
						<div class="form-row language-row">
							<div class="form-group language-group">
								<label><span class="star">*</span> 
									<spring:bind path="cmtPrimaryLanguage">
										<span class='${status.error ? "txtError" : ""}'>  
											<fmt:message key="languageQues1"/>
										</span>
									</spring:bind>
								</label>
								<div class="radio-group">
									<label class="radio-option">
										<form:radiobutton tabindex="313" path="cmtPrimaryLanguage" value="E" id="cmtPrimaryLanguage1"/>
										<fmt:message key="english"/>
									</label>
									<label class="radio-option">
										<form:radiobutton tabindex="314" path="cmtPrimaryLanguage" value="O" id="cmtPrimaryLanguage2"/>
										<fmt:message key="other"/>
									</label>
									<div class="language-select">
										<form:select path="cmtOtherPrimaryLanguage" id="cmtOtherPrimaryLanguage" value="${pageDTO.cmtOtherPrimaryLanguage}" tabindex="315" class="form-control">
											<option value=""><fmt:message key="selectOne"/></option>
											<c:forEach items="${otherLanguages}" var="row">
												<option value="${row.value}" <c:if test="${pageDTO.cmtOtherPrimaryLanguage == row.value}">selected="selected"</c:if>>
													<c:out value="${row.label}"/>
												</option>
											</c:forEach>
										</form:select>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Language Skills -->
						<div class="form-row language-skills-row">
							<div class="form-group language-skills-group">
								<label><span class="star">*</span>
									<spring:bind path="cmtPrimaryLanguageSkill">
										<span class='${status.error ? "txtError" : ""}'>  
											<fmt:message key="languageQues2"/>
										</span>
									</spring:bind>
								</label>
								<div class="checkbox-group">
									<label class="checkbox-option">
										<form:checkbox tabindex="316" id="cmtLangSkillRead" path="cmtLangSkillRead" value="R"/>
										<fmt:message key="languageRead"/>
									</label>
									<label class="checkbox-option">
										<form:checkbox tabindex="317" id="cmtLangSkillWrite" path="cmtLangSkillWrite" value="W"/>
										<fmt:message key="languageWrite"/>
									</label>
									<label class="checkbox-option">
										<form:checkbox tabindex="318" id="cmtLangSkillSpeak" path="cmtLangSkillSpeak" value="S"/>
										<fmt:message key="languageSpeak"/>
									</label>
								</div>
							</div>
						</div>
						
						<!-- High School Graduation -->
						<div class="form-row graduation-row">
							<div class="form-group graduation-group">
								<label for="cmtHighSchoolGradYr"><span class="star">*</span> 
									<spring:bind path="cmtHighSchoolGradYr">
										<span class='${status.error ? "txtError" : ""}'>  
											<fmt:message key="highSchoolGradYr"/>
										</span>
									</spring:bind>
								</label>
								<div class="graduation-inputs">
									<form:input id="cmtHighSchoolGradYr" tabindex="319" path="cmtHighSchoolGradYr" maxlength="4" class="form-control numeric"/>
									<label class="checkbox-option">
										<form:checkbox tabindex="320" id="cmtHighSchoolGradYrNA" path="cmtHighSchoolGradYrNA" value="9999"/>
										<fmt:message key="chooseNoAnswer"/>
									</label>
								</div>
							</div>
						</div>
						
						<!-- U.S. Citizen -->
						<div class="form-row citizen-row">
							<div class="form-group citizen-group">
								<label><span class="star">*</span> 
									<spring:bind path="cmtCitizenInd">
										<span class='${status.error ? "txtError" : ""}'>  
											<fmt:message key="citizenQuesMsg"/>
										</span>
									</spring:bind>
								</label>
								<div class="radio-group">
									<label class="radio-option">
										<form:radiobutton tabindex="321" path="cmtCitizenInd" id="cmtCitizenInd1" value="Y"/>
										<fmt:message key="yes"/>
									</label>
									<label class="radio-option">
										<form:radiobutton tabindex="322" path="cmtCitizenInd" id="cmtCitizenInd2" value="N"/>
										<fmt:message key="no"/>
									</label>
								</div>
							</div>
						</div>
						
						<!-- Alien Information -->
						<div class="form-row alien-row" id="alienInfo">
							<div class="form-group alien-group">
								<label for="cmtAlienType" class="notmandatory">
									<spring:bind path="cmtAlienType">
										<span class='${status.error ? "txtError" : ""}'>   
											<fmt:message key="workAuthorizationQuesMsg"/>
										</span>
									</spring:bind>
								</label>
								<form:select tabindex="323" id="cmtAlienType" path="cmtAlienType" value="${pageDTO.cmtAlienType}" class="form-control">
									<option value=""><fmt:message key="selectOne"/></option>
									<c:forEach items="${alienTypeList}" var="row">
										<option value="${row.alvId}" <c:if test="${pageDTO.cmtAlienType == row.alvId}">selected="selected"</c:if>>
											<c:choose>
												<c:when test="${pageDTO.language == 'es_US'}">
													<c:out value="${row.alvSpShortDescTxt}"/>
												</c:when>
												<c:otherwise>
													<c:out value="${row.alvShortDescTxt}"/>
												</c:otherwise>
											</c:choose>
										</option>
									</c:forEach>
								</form:select>
							</div>
							
							<div class="form-group alien-details">
								<div class="alien-number">
									<label for="cmtAlienNumber" class="notmandatory">
										<spring:bind path="cmtAlienNumber">
											<span class='${status.error ? "txtError" : ""}'>   
												<fmt:message key="aaNumber"/>
											</span>
										</spring:bind> 
									</label>
									<form:input tabindex="324" id="cmtAlienNumber" path="cmtAlienNumber" value="${pageDTO.cmtAlienNumber}" maxlength="11" class="form-control"/>
								</div>
								
								<div class="alien-expiration">
									<label for="cmtAlienExpireDate" class="notmandatory">
										<spring:bind path="cmtAlienExpireDate">
											<span class='${status.error ? "txtError" : ""}'>   
												<fmt:message key="expirationDate"/>
											</span>
										</spring:bind>
									</label>
									<form:input tabindex="325" id="cmtAlienExpireDate" path="cmtAlienExpireDate" value="${pageDTO.cmtAlienExpireDate}" maxlength="10" class="form-control"/>
								</div>
							</div>
						</div>
						
						<!-- Disability -->
						<div class="form-row disability-row">
							<div class="form-group disability-group">
								<label><span class="star">*</span> 
									<spring:bind path="cmtDisability">
										<span class='${status.error ? "txtError" : ""}'>  
											<fmt:message key="disabledQuestion"/>
										</span>
									</spring:bind>
								</label>
								<div class="radio-group">
									<label class="radio-option">
										<form:radiobutton tabindex="326" path="cmtDisability" value="<%= ApplicationTypeCodes.CMT_DISABILITY_YES %>"/>
										<fmt:message key="yes"/>
									</label>
									<label class="radio-option">
										<form:radiobutton tabindex="327" path="cmtDisability" value="<%= ApplicationTypeCodes.CMT_DISABILITY_NO %>"/>
										<fmt:message key="no"/>
									</label>
									<label class="radio-option">
										<form:radiobutton tabindex="328" path="cmtDisability" value="<%= ApplicationTypeCodes.CMT_DISABILITY_NO_ANSWER %>"/>
										<fmt:message key="chooseNoAnswer"/>
									</label>
								</div>
							</div>
						</div>
						
						<!-- Vocational Rehab (Conditional) -->
						<c:if test="${pageDTO.sourceCd eq '4184' && pageDTO.capFilingProgCd eq '64'}">
							<div class="form-row voc-rehab-row">
								<div class="form-group voc-rehab-group">
									<p><fmt:message key="vocRehabDisplay"/></p>
									<label><span class="star">*</span> 
										<spring:bind path="cmtClxVrServInd">
											<span class='${status.error ? "txtError" : ""}'>  
												<fmt:message key="vocRehabQuestion"/>
											</span>
										</spring:bind>
									</label>
									<div class="radio-group">
										<label class="radio-option">
											<form:radiobutton tabindex="329" path="cmtClxVrServInd" value="Y"/>
											<fmt:message key="yes"/>
										</label>
										<label class="radio-option">
											<form:radiobutton tabindex="330" path="cmtClxVrServInd" value="N"/>
											<fmt:message key="no"/>
										</label>
									</div>
								</div>
							</div>
						</c:if>
					</div>
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
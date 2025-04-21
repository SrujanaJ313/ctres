<%@ include file="/common/taglibs.jsp" %>
<fmt:bundle basename="ApplicationResources" prefix="regular.">
<head>
     <meta name="_csrf" content="${_csrf.token}"/>
   	 <!-- default header name is X-CSRF-TOKEN -->
   	<meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<table>
	<tr>
		<td width="12%" class="rowht">
			<label for="addressLine1"><span class="star">*</span> 
                  <spring:bind path="addressDTO.addressLine1">
            		<span class='${status.error ? 'txtError' : ''}'>  
				    	<fmt:message key="addressLine1"></fmt:message>
				    </span>
	          	</spring:bind>
			</label>		
		</td>
		<td width="40%">
			<form:input tabindex="${regularTabIndex}" id="addressLine1" path="addressDTO.addressLine1" maxlength="40" type="text" value="${pageDTO.addressDTO.addressLine1}" class="txt240 form-control"/>
		</td>
		<td width="50%">
			<label for="poBox" class="fleft">
				<spring:bind path="addressDTO.poBox">
            		<span class='${status.error ? 'txtError' : ''}'>  
				    	<fmt:message key="poBox"></fmt:message>
				    </span>
	          	</spring:bind>
			</label>
			<span style="padding-left: 5.75%">
				<form:input tabindex="${regularTabIndex+5}" id="poBox" path="addressDTO.poBox" maxlength="20" type="text" value="${pageDTO.addressDTO.poBox}" class="txt150 form-control" />
			</span>
		</td>
	</tr>
	
	<tr>
		<td class="rowht">
			<label class="l1indent" for="addressLine2"></label>
		</td>
		<td width="40%">
			<form:input tabindex="${regularTabIndex+10}" id="addressLine2" path="addressDTO.addressLine2" maxlength="40" type="text" value="${pageDTO.addressDTO.addressLine2}" class="txt240 form-control"/>
		</td>
		<td width="50%">
			<c:if test="${displayaddrline3 eq 'false'}">
					<label for="country"><span class="star">*</span> 
						<spring:bind path="addressDTO.country">
		            		<span class='${status.error ? 'txtError' : ''}'>  
						    	<fmt:message key="country"></fmt:message>
						    </span>
			          	</spring:bind>
					</label>
					<select tabindex="${regularTabIndex+20}" class="med" style="font:normal 12px calibri" name = "addressDTO.country" id="country" value="${pageDTO.addressDTO.country}" onchange="populateState('#country','#state',true);">
						<c:forEach items="${countryCodes}" var="row">
					        <option value ="${row.label}" <c:if test="${pageDTO.addressDTO.country == row.label}">selected = "selected"</c:if>>
					        <c:out value="${row.value}"></c:out></option>
					 	</c:forEach> 
					</select>
					<label for="state">
						<span class="star">*</span> 
			          	<spring:bind path="addressDTO.state">
			          		<span class='${status.error ? 'txtError' : ''}'>  
					    		<fmt:message key="state"></fmt:message>
					    	</span>
		         		</spring:bind>
					</label>
					<select class="sm" tabindex="${regularTabIndex+30}" style="font:normal 12px calibri" name="addressDTO.state" id="state" value="${pageDTO.addressDTO.state}">
						<option value="">--</option>  
						<c:forEach items="${stateCodes}" var="row">
					        <option value ="${row.label}" <c:if test="${pageDTO.addressDTO.state == row.label}">selected = "selected"</c:if>>
					        <c:out value="${row.label}"></c:out></option>
					 	</c:forEach> 
					</select>
			</c:if>
		</td>
	</tr>
	
	<c:if test="${displayaddrline3 ne 'false'}">
	<tr>
		<td class="rowht" width="12%">
			<label class="l1indent" for="addressLine3"></label>
		</td>
		<td width="40%">
			<form:input tabindex="${regularTabIndex+15}" id="addressLine3" path="addressDTO.addressLine3" maxlength="40" type="text" value="${pageDTO.addressDTO.addressLine3}" class="txt240 form-control"/>
		</td>
		<td width="50%">
			<label for="country"><span class="star">*</span> 
				<spring:bind path="addressDTO.country">
            		<span class='${status.error ? 'txtError' : ''}'>  
				    	<fmt:message key="country"></fmt:message>
				    </span>
	          	</spring:bind>
			</label>
			<select tabindex="${regularTabIndex+20}" class="med" style="font:normal 12px calibri" name = "addressDTO.country" id="country" value="${pageDTO.addressDTO.country}" onchange="populateState('#country','#state',true);">
				<c:forEach items="${countryCodes}" var="row">
			        <option value ="${row.label}" <c:if test="${pageDTO.addressDTO.country == row.label}">selected = "selected"</c:if>>
			        <c:out value="${row.value}"></c:out></option>
			 	</c:forEach> 
			</select>
			<label for="state">
				<span class="star">*</span> 
	          	<spring:bind path="addressDTO.state">
	          		<span class='${status.error ? 'txtError' : ''}'>  
			    		<fmt:message key="state"></fmt:message>
			    	</span>
         		</spring:bind>
			</label>
			<select class="sm" tabindex="${regularTabIndex+30}" style="font:normal 12px calibri" name="addressDTO.state" id="state" value="${pageDTO.addressDTO.state}">
				<option value="">--</option>  
				<c:forEach items="${stateCodes}" var="row">
			        <option value ="${row.label}" <c:if test="${pageDTO.addressDTO.state == row.label}">selected = "selected"</c:if>>
			        <c:out value="${row.label}"></c:out></option>
			 	</c:forEach> 
			</select>
		</td>
	</tr>
	</c:if>
	
	<tr>
		<td width="12%">
			<label for="city"><span class="star">*</span> 
				<spring:bind path="addressDTO.city">
            		<span class='${status.error ? 'txtError' : ''}'>  
				    	<fmt:message key="city"></fmt:message>
				    </span>
	          	</spring:bind>	
			 </label>
		</td>
		
		<td width="40%">
			<form:input tabindex="${regularTabIndex+25}" id="city" path="addressDTO.city" maxlength="30" type="text" value="${pageDTO.addressDTO.city}" class="txt240 form-control" cssStyle="height:19px; width:240px;  !important;"/>
		</td>
		
		<td width="50%">
			<span id="zipcodeLabelId">
				<label for="zipCode1" class="fleft">
					<span class="star">*</span> 
					<spring:bind path="addressDTO.zipCode1">
	            		<span class='${status.error ? 'txtError' : ''}'>  
					    	<fmt:message key="zipCode1"></fmt:message>
					    </span>
		          	</spring:bind>
				</label>
			</span>
			<span id="zipcodeId" style="padding-left: 10%">
				<form:input class="txt75 form-control numeric" tabindex="${regularTabIndex+35}" path="addressDTO.zipCode1" id="zipCode1" maxlength="5" type="text" value="${pageDTO.addressDTO.zipCode1}"  />
				<span class="">-</span>
				<label class="hidden" for="zipCode2"></label>
				<form:input tabindex="${regularTabIndex+40}" path="addressDTO.zipCode2" id="zipCode2" maxlength="4" type="text" value="${pageDTO.addressDTO.zipCode2}" class="txt60 form-control numeric"/>
			</span>
			<span id="postalLabelId">
				<label for="postalCode" class="fleft">
					<span class="star">*</span>
					<spring:bind path="addressDTO.postalCode">
	            		<span class='${status.error ? 'txtError' : ''}'>  
					    	<fmt:message key="postalCode"></fmt:message>
					    </span>
		          	</spring:bind>
				 </label>
			</span>
			
			<span id="postalId" style="padding-left: 5%">
				<form:input class="txt80 form-control" tabindex="${regularTabIndex+35}" path="addressDTO.postalCode" id="postalCode" maxlength="7" type="text" value="${pageDTO.addressDTO.postalCode}"/>
			</span>
		</td>	
	</tr>
</table>
</fmt:bundle>
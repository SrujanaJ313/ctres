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
 			<label for="physicalAddressLine1"><span class="star">*</span> 
 				<spring:bind path="addressDTO.physicalAddressLine1">
 			         		<span class='${status.error ? 'txtError' : ''}'>  
 				    	<fmt:message key="addressLine1"></fmt:message>
 				    </span>
 			     </spring:bind>
 			</label>
 		</td>
 		<td width="40%"><form:input tabindex="${physicalTabIndex}" id="physicalAddressLine1" path="addressDTO.physicalAddressLine1" maxlength="40" type="text" value="${pageDTO.addressDTO.physicalAddressLine1}" class="txt240 form-control"/></td>
 		<td></td>
 	</tr>
 	
 	<tr>
 		<td class="rowht"><label class="l1indent" for="physicalAddressLine2"></label></td>
 		<td width="40%">
 			<form:input tabindex="${physicalTabIndex+5}" id="physicalAddressLine2" path="addressDTO.physicalAddressLine2" maxlength="40" type="text" value="${pageDTO.addressDTO.physicalAddressLine2}" class="txt240 form-control"/>
 		</td>
 		<td width="50%">
 			<c:if test="${displayaddrline3 eq 'false'}">
 					<label for="physicalCountry"><span class="star">*</span> 
 					<spring:bind path="addressDTO.physicalCountry">
 				         		<span class='${status.error ? 'txtError' : ''}'>  
 					    	<fmt:message key="country"></fmt:message>
 					    </span>
 				     </spring:bind>
 					</label>
 					<select tabindex="${physicalTabIndex+15}" class="med" style="font:normal 12px calibri" name = "addressDTO.physicalCountry" id="physicalCountry" value="${pageDTO.addressDTO.physicalCountry}" onchange="populateState('#physicalCountry','#physicalState',false);">
 						<c:forEach items="${physicalCountryCodes}" var="row">
 					        <option value ="${row.label}" <c:if test="${pageDTO.addressDTO.physicalCountry == row.label}">selected = "selected"</c:if>>
 					        <c:out value="${row.value}"></c:out></option>
 					 	</c:forEach> 
 					</select>
 					<label for="physicalState"><span class="star">*</span>
 					    <spring:bind path="addressDTO.physicalState">
 					         		<span class='${status.error ? 'txtError' : ''}'>  
 						    			<fmt:message key="state"></fmt:message>
 						    		</span>
 				    	</spring:bind>
 					</label>
 					<select class="sm" tabindex="${physicalTabIndex+25}" style="font:normal 12px calibri" name="addressDTO.physicalState" id="physicalState" value="${pageDTO.addressDTO.physicalState}">
 							<option value="">--</option>  
 							<c:forEach items="${physicalStateCodes}" var="row">
 						        <option value ="${row.label}" <c:if test="${pageDTO.addressDTO.physicalState == row.label}">selected = "selected"</c:if>>
 						        <c:out value="${row.label}"></c:out></option>
 						 	</c:forEach> 
 					</select> 
 			</c:if>
 		</td>
 	</tr>
 	
 	<c:if test="${displayaddrline3 ne 'false'}">
 		<tr>
 			<td class="rowht" width="12%"><label class="l1indent" for="physicalAddressLine3"></label></td>
 			<td width="40%"><form:input tabindex="${physicalTabIndex+10}" id="physicalAddressLine3" path="addressDTO.physicalAddressLine3" maxlength="40" type="text" value="${pageDTO.addressDTO.physicalAddressLine3}" class="txt240 form-control"/></td>
 			<td width="50%">
 				<label for="physicalCountry"><span class="star">*</span> 
 				<spring:bind path="addressDTO.physicalCountry">
 			         		<span class='${status.error ? 'txtError' : ''}'>  
 				    	<fmt:message key="country"></fmt:message>
 				    </span>
 			     </spring:bind>
 				</label>
 				<select tabindex="${physicalTabIndex+15}" class="med" style="font:normal 12px calibri" name = "addressDTO.physicalCountry" id="physicalCountry" value="${pageDTO.addressDTO.physicalCountry}" onchange="populateState('#physicalCountry','#physicalState',false);">
 					<c:forEach items="${physicalCountryCodes}" var="row">
 				        <option value ="${row.label}" <c:if test="${pageDTO.addressDTO.physicalCountry == row.label}">selected = "selected"</c:if>>
 				        <c:out value="${row.value}"></c:out></option>
 				 	</c:forEach> 
 				</select>
 				<label for="physicalState">
 					<span class="star">*</span>
 				    <spring:bind path="addressDTO.physicalState">
 				         		<span class='${status.error ? 'txtError' : ''}'>  
 					    			<fmt:message key="state"></fmt:message>
 					    		</span>
 			    	</spring:bind>
 				</label>
 				<select class="sm" tabindex="${physicalTabIndex+25}" style="font:normal 12px calibri" name="addressDTO.physicalState" id="physicalState" value="${pageDTO.addressDTO.physicalState}">
 						<option value="">--</option>  
 						<c:forEach items="${physicalStateCodes}" var="row">
 					        <option value ="${row.label}" <c:if test="${pageDTO.addressDTO.physicalState == row.label}">selected = "selected"</c:if>>
 					        <c:out value="${row.label}"></c:out></option>
 					 	</c:forEach> 
 				</select> 
 			</td>
 		</tr>
 	</c:if>
 	
 	
 	
 	<tr>
 		<td width="12%">
 			<label for="physicalCity"><span class="star">*</span> 
 				<spring:bind path="addressDTO.physicalCity">
 		         		<span class='${status.error ? 'txtError' : ''}'>  
 			    			<fmt:message key="city"></fmt:message>
 			    		</span>
 		     	</spring:bind>
 		 	</label>
 		</td>
 		
 		<td width="40%">
 			<form:input tabindex="${physicalTabIndex+20}" id="physicalCity" path="addressDTO.physicalCity" maxlength="30" type="text" value="${pageDTO.addressDTO.physicalCity}" class="txt240 form-control" cssStyle="height:19px; width:240px;  !important;"/>
 		</td>
 		
 		<td width="50%">
 			<span id="physicalZipcodeLabelId">
 				<label class="fleft" for="physicalZipCode1"><span class="star">*</span> 
 				<spring:bind path="addressDTO.physicalZipCode1">
 		         		<span class='${status.error ? 'txtError' : ''}'>  
 			    	<fmt:message key="zipCode1"></fmt:message>
 			    </span>
 		     	</spring:bind>
 				</label>
 			</span>
 			
 			<span id="physicalZipcodeId" style="padding-left: 10%">
 				<form:input class="txt75 form-control  numeric" tabindex="${physicalTabIndex+30}" id="physicalZipCode1" path="addressDTO.physicalZipCode1" maxlength="5" type="text" value="${pageDTO.addressDTO.physicalZipCode1}" />
 				<span class="">-</span>
 				<label class="hidden" for="physicalZipCode2"></label>
 				<form:input tabindex="${physicalTabIndex+35}" id="physicalZipCode2" path="addressDTO.physicalZipCode2" maxlength="4" type="text" value="${pageDTO.addressDTO.physicalZipCode2}" class="txt60 form-control numeric"/>
 			</span>
 			
 			<span id="physicalPostalLabelId"><label class="fleft" for="physicalPostalCode"><span class="star">*</span> 
 				<spring:bind path="addressDTO.physicalPostalCode">
 		         		<span class='${status.error ? 'txtError' : ''}'>  
 			    	<fmt:message key="postalCode"></fmt:message>
 			    </span>
 		     	</spring:bind>
 		     	</label>
 			</span>
 			
 			<span id="physicalPostalId" style="padding-left: 5%">
 				<form:input class="txt80 form-control" tabindex="${regularTabIndex+30}" id="physicalPostalCode" path="addressDTO.physicalPostalCode" maxlength="7" type="text" value="${pageDTO.addressDTO.physicalPostalCode}"/>
 			</span>
 		</td>
 		
 	</tr>
 </table>
 </fmt:bundle>
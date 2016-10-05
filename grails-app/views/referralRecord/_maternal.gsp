


            <div class="row">
                <div class="col-lg-6">
                    <div class="">
                        <label class="control-label">Breast And Or Ovarian Cancer</label>
                        <div>
                            <g:if test="${referralRecordInstance?.maternal?.first()?.breastAndOrOvarianCancer}">
                                <g:set var="breastAndOrOvarianCancerMaternal" value="${referralRecordInstance?.maternal?.first()?.breastAndOrOvarianCancer}" />
                            </g:if>
                            <g:elseif test="${params.breastAndOrOvarianCancerMaternal}">
                                <g:set var="breastAndOrOvarianCancerMaternal" value="${params.breastAndOrOvarianCancerMaternal}" />
                            </g:elseif>
                            <g:else>
                                <g:set var="breastAndOrOvarianCancerMaternal" value="${false}" />
                            </g:else>
                            <g:radioGroup name="breastAndOrOvarianCancerMaternal"
                                          values="[true, false]"
                                          labels="['Yes', 'No']"
                                          value="${breastAndOrOvarianCancerMaternal}">
                                ${it.radio}  ${it.label} &nbsp;
                            </g:radioGroup>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="">
                        <label class="control-label">Colorectal Cancer</label>
                        <div>
                            <g:if test="${referralRecordInstance?.maternal?.first()?.colorectalCancer}">
                                <g:set var="colorectalCancerMaternal" value="${referralRecordInstance?.maternal?.first()?.colorectalCancer}" />
                            </g:if>
                            <g:elseif test="${params.colorectalCancerMaternal}">
                                <g:set var="colorectalCancerMaternal" value="${params.colorectalCancerMaternal}" />
                            </g:elseif>
                            <g:else>
                                <g:set var="colorectalCancerMaternal" value="${false}" />
                            </g:else>
                            <g:radioGroup name="colorectalCancerMaternal"
                                          values="[true, false]"
                                          labels="['Yes', 'No']"
                                          value="${colorectalCancerMaternal}">
                                ${it.radio}  ${it.label} &nbsp;
                            </g:radioGroup>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="">
                        <label class="control-label">Ischaemic Heart Disease Or Stroke</label>
                        <div>
                            <g:if test="${referralRecordInstance?.maternal?.first()?.ischaemicHeartDiseaseOrStroke}">
                                <g:set var="ischaemicHeartDiseaseOrStrokeMaternal" value="${referralRecordInstance?.maternal?.first()?.ischaemicHeartDiseaseOrStroke}" />
                            </g:if>
                            <g:elseif test="${params.ischaemicHeartDiseaseOrStrokeMaternal}">
                                <g:set var="ischaemicHeartDiseaseOrStrokeMaternal" value="${params.ischaemicHeartDiseaseOrStrokeMaternal}" />
                            </g:elseif>
                            <g:else>
                                <g:set var="ischaemicHeartDiseaseOrStrokeMaternal" value="${false}" />
                            </g:else>
                            <g:radioGroup name="ischaemicHeartDiseaseOrStrokeMaternal"
                                          values="[true, false]"
                                          labels="['Yes', 'No']"
                                          value="${ischaemicHeartDiseaseOrStrokeMaternal}">
                                ${it.radio}  ${it.label} &nbsp;
                            </g:radioGroup>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="">
                        <label class="control-label">Endocrine Tumours</label>
                        <div>
                            <g:if test="${referralRecordInstance?.maternal?.first()?.endocrineTumours}">
                                <g:set var="endocrineTumoursMaternal" value="${referralRecordInstance?.maternal?.first()?.endocrineTumours}" />
                            </g:if>
                            <g:elseif test="${params.endocrineTumoursMaternal}">
                                <g:set var="endocrineTumoursMaternal" value="${params.endocrineTumoursMaternal}" />
                            </g:elseif>
                            <g:else>
                                <g:set var="endocrineTumoursMaternal" value="${false}" />
                            </g:else>
                            <g:radioGroup name="endocrineTumoursMaternal"
                                          values="[true, false]"
                                          labels="['Yes', 'No']"
                                          value="${endocrineTumoursMaternal}">
                                ${it.radio}  ${it.label} &nbsp;
                            </g:radioGroup>
                        </div>
                    </div>
                </div>
            </div>


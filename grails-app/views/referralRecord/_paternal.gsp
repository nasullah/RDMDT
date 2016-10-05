



            <div class="row">

                <div class="col-lg-6">
                    <div class="">
                        <label class="control-label">Breast And Or Ovarian Cancer</label>
                        <div>
                            <g:if test="${referralRecordInstance?.paternal?.first()?.breastAndOrOvarianCancer}">
                                <g:set var="breastAndOrOvarianCancerPaternal" value="${referralRecordInstance?.paternal?.first()?.breastAndOrOvarianCancer}" />
                            </g:if>
                            <g:elseif test="${params.breastAndOrOvarianCancerPaternal}">
                                <g:set var="breastAndOrOvarianCancerPaternal" value="${params.breastAndOrOvarianCancerPaternal}" />
                            </g:elseif>
                            <g:else>
                                <g:set var="breastAndOrOvarianCancerPaternal" value="${false}" />
                            </g:else>
                            <g:radioGroup name="breastAndOrOvarianCancerPaternal"
                                          values="[true, false]"
                                          labels="['Yes', 'No']"
                                          value="${breastAndOrOvarianCancerPaternal}">
                                ${it.radio}  ${it.label} &nbsp;
                            </g:radioGroup>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="">
                        <label class="control-label">Colorectal Cancer</label>
                        <div>
                            <g:if test="${referralRecordInstance?.paternal?.first()?.colorectalCancer}">
                                <g:set var="colorectalCancerPaternal" value="${referralRecordInstance?.paternal?.first()?.colorectalCancer}" />
                            </g:if>
                            <g:elseif test="${params.colorectalCancerPaternal}">
                                <g:set var="colorectalCancerPaternal" value="${params.colorectalCancerPaternal}" />
                            </g:elseif>
                            <g:else>
                                <g:set var="colorectalCancerPaternal" value="${false}" />
                            </g:else>
                            <g:radioGroup name="colorectalCancerPaternal"
                                          values="[true, false]"
                                          labels="['Yes', 'No']"
                                          value="${colorectalCancerPaternal}">
                                ${it.radio}  ${it.label} &nbsp;
                            </g:radioGroup>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="">
                        <label class="control-label">Ischaemic Heart Disease Or Stroke</label>
                        <div>
                            <g:if test="${referralRecordInstance?.paternal?.first()?.ischaemicHeartDiseaseOrStroke}">
                                <g:set var="ischaemicHeartDiseaseOrStrokePaternal" value="${referralRecordInstance?.paternal?.first()?.ischaemicHeartDiseaseOrStroke}" />
                            </g:if>
                            <g:elseif test="${params.ischaemicHeartDiseaseOrStrokePaternal}">
                                <g:set var="ischaemicHeartDiseaseOrStrokePaternal" value="${params.ischaemicHeartDiseaseOrStrokePaternal}" />
                            </g:elseif>
                            <g:else>
                                <g:set var="ischaemicHeartDiseaseOrStrokePaternal" value="${false}" />
                            </g:else>
                            <g:radioGroup name="ischaemicHeartDiseaseOrStrokePaternal"
                                          values="[true, false]"
                                          labels="['Yes', 'No']"
                                          value="${ischaemicHeartDiseaseOrStrokePaternal}">
                                ${it.radio}  ${it.label} &nbsp;
                            </g:radioGroup>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="">
                        <label class="control-label">Endocrine Tumours</label>
                        <div>
                            <g:if test="${referralRecordInstance?.paternal?.first()?.endocrineTumours}">
                                <g:set var="endocrineTumoursPaternal" value="${referralRecordInstance?.paternal?.first()?.endocrineTumours}" />
                            </g:if>
                            <g:elseif test="${params.endocrineTumoursPaternal}">
                                <g:set var="endocrineTumoursPaternal" value="${params.endocrineTumoursPaternal}" />
                            </g:elseif>
                            <g:else>
                                <g:set var="endocrineTumoursPaternal" value="${false}" />
                            </g:else>
                            <g:radioGroup name="endocrineTumoursPaternal"
                                          values="[true, false]"
                                          labels="['Yes', 'No']"
                                          value="${endocrineTumoursPaternal}">
                                ${it.radio}  ${it.label} &nbsp;
                            </g:radioGroup>
                        </div>
                    </div>
                </div>
            </div>
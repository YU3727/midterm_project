<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>



	$(function(){

		setWriter('${member.id}');
		setTotalPage('${pager.totalPage}')
		setBoardId('${boardId}')
	})
</script>
		<c:forEach items="${list}" var="dto">
			<div class="col-md-8 mx-auto" id="${boardName}${dto.num}"  style="height: 100%;">

				<div class="d-flex flex-column mb-3">
					<div class="card col-md-5 mx-5">
					  <div class="card-body">
						<div class="" style="height: 30px;">
							<span class="card-title" style="float: left;">${dto.writer}</span>
							<span class="card-title calcDate"  style="float: right;" id="reg${dto.num}" data-board-num="${dto.num}">
								${dto.regDate}
								<script>

									$(document).ready(function(){
										let regDate = '${dto.regDate}';
										$('#reg'+'${dto.num}').text(getDateDiff(regDate));
									})

								
								
								</script>
							</span>
						</div>
						<div class="border border-bottom"></div>
						<div class="col-md-12 my-1">
					    	<h5 class="card-title" style="display: inline; font-weight: bold; font-size: 16px;">${dto.title}</h5>
							<span class="p-2 mb-3 float-right">
								<button class="btnToggle" style="border : 0px; background-color: transparent;" data-board-num="${dto.num}">
									<img alt="토글 버튼" src="/resources/images/menu/kebobMenu.png" style="width:12px; height:12px;">
								</button>
							</span>				
						</div>
						<c:if test="${!empty dto.boardFileDTOs}">
							<div id="carouselExampleInterval${dto.num}" class="carousel slide" data-bs-ride="carousel">
								<div class="carousel-inner">
									<c:forEach items="${dto.boardFileDTOs}" var="fileDTO" varStatus="i">
										<c:if test="${i.first}">
											  <div class="carousel-item active" data-bs-interval="100000">
												<img src="../resources/upload/${boardName}/${fileDTO.fileName}" class="d-block w-100" alt="...">
											  </div>
										</c:if>
										<c:if test="${!i.first}">
											  <div class="carousel-item" data-bs-interval="100000">
												<img src="../resources/upload/${boardName}/${fileDTO.fileName}" class="d-block w-100" alt="...">
											  </div>
										</c:if>

									</c:forEach>
								</div>
						  </div>
						
							<button class="carousel-control-prev" style="width: auto; height: auto; margin: 0 10px;" type="button" data-bs-target="#carouselExampleInterval${dto.num}" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" style="width: auto; height: auto; margin: 0 10px;" type="button" data-bs-target="#carouselExampleInterval${dto.num}" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							  </button>
						  
					
					</c:if>

					    <p class="card-text">${dto.contents}</p>
					    <p class="card-text"><small class="text-muted">${dto.regDate}</small></p>
					  </div>


					  	<!-- <div class="commentList">
							<a class="moreComment" href="#" data-board-num="$(dto.num)">${dto.num}댓글 보기</a>
							
						</div> -->
						<!-- Button trigger modal -->
						<a type="button" class="getDetail" id="getDetail${dto.num}" data-board-num="${dto.num}" data-bs-toggle="modal" data-bs-target="#exampleModal${dto.num}">
							<script>
								$(()=>{
									$.ajax({
										url : '../${boardName}Comment/listCount',
										type : 'GET',
										data : {
											num : '${dto.num}',
										},
										success : function(data){
											$("a[id='getDetail${dto.num}']").text('댓글' + data.trim() + '개 모두 보기');
										}
									})
								})
							</script>
						</a >
						
						<div class="card-body my-1">							
							<form action="../${boardName}Comment/add" method="post">
								<input class="replyWriter" type="hidden" name="writer" value="${member.id}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="boardId" value="${dto.boardId}">
								
									<input class="border border-0 replyContents"  id="replyContents" type="text" data-board-num="${dto.num}" style="font-size: 13px;" name="contents" value="" placeholder="댓글 달기...">
									<a class="replyAdd" data-board-num="${dto.num}" id="replyAdd"></a>
								
							</form>
						</div>
						
						
						
						
						
						<!-- Modal -->
						
							<div class="modal fade" id="exampleModal${dto.num}" tabindex="-1" aria-labelledby="exampleModalLabel${dto.num}" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel${dto.num}">${dto.writer}님의 게시물</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" data-board-num="${dto.num}"></button>
									</div>
									<div class="modal-body">
										<div class="d-flex flex-column mb-3">
											<div class="card col-md-5 mx-5">
												<div class="card-body">
													<div class="" style="height: 30px;">
														<span class="card-title" style="float: left;">${dto.writer}</span>
														<span class="card-title calcDate"  style="float: right;"id="modalReg${dto.num}" data-board-num="${dto.num}">
															${dto.regDate}
															<script>

								
																$(document).ready(function(){
																	let regDate = '${dto.regDate}';
																	$('#modalReg'+'${dto.num}').text(getDateDiff(regDate));
																})
								

															</script>
														</span>
													</div>
													<c:if test="${!empty dto.boardFileDTOs}">
														<div id="carouselExampleInterval${dto.num}" class="carousel slide" data-bs-ride="carousel">
															<div class="carousel-inner">
																<c:forEach items="${dto.boardFileDTOs}" var="fileDTO" varStatus="i">
																	<c:if test="${i.first}">
																		<div class="carousel-item active" data-bs-interval="100000">
																			<img src="../resources/upload/${boardName}/${fileDTO.fileName}" class="d-block w-100" alt="...">
																		</div>
																	</c:if>
																	<c:if test="${!i.first}">
																		<div class="carousel-item" data-bs-interval="100000">
																			<img src="../resources/upload/${boardName}/${fileDTO.fileName}" class="d-block w-100" alt="...">
																		</div>
																	</c:if>
								
																</c:forEach>
															</div>
													</div>
													
														<button class="carousel-control-prev" style="width: auto; height: auto; margin: 0 10px;" type="button" data-bs-target="#carouselExampleInterval${dto.num}" data-bs-slide="prev">
															<span class="carousel-control-prev-icon" aria-hidden="true"></span>
															<span class="visually-hidden">Previous</span>
														</button>
														<button class="carousel-control-next" style="width: auto; height: auto; margin: 0 10px;" type="button" data-bs-target="#carouselExampleInterval${dto.num}" data-bs-slide="next">
															<span class="carousel-control-next-icon" aria-hidden="true"></span>
															<span class="visually-hidden">Next</span>
														</button>
													
												
												</c:if>
												</div>
												<p class="card-text">${dto.contents}</p>
										
											</div>
										
										</div>

										<div id="commentList${dto.num}" data-board-name="${boardName}">

										</div>

										<div class="modal-footer">
											<div class="card-body my-1">							
												<form action="../${boardName}Comment/add" method="post">
													<input class="replyWriter" type="hidden" name="writer" value="${member.id}">
													<input type="hidden" name="num" value="${dto.num}">
													<input type="hidden" name="boardId" value="${dto.boardId}">
													
														<input class="border border-0 modalReplyContents"  id="replyContents" data-board-num="${dto.num}" type="text" style="font-size: 13px;" name="contents" value="" placeholder="댓글 달기...">
														<a class="modalReplyAdd" data-board-num="${dto.num}" id="replyAdd"></a>
													
												</form>
											</div>
										</div>

										</div>
									</div>
								</div>
							
							

								</div>




					</div>
					<span class="p-2 boardMenu" id="boardMenu${dto.num}" style="display: none;">
						<div class="list-group">
							<button type="button" class="list-group-item list-group-item-action update" data-board-num="${dto.num}" aria-current="true">
								수정
							</button>
							<button type="button" class="list-group-item list-group-item-action delete" data-board-num="${dto.num}">삭제</button>
							<button type="button" class="list-group-item list-group-item-action report" data-board-num="${dto.num}" data-board-writer="${dto.writer}">신고하기</button>
						</div>
					</span>
				</div>
			</div>
		</c:forEach> 		




		

		
	

	
	
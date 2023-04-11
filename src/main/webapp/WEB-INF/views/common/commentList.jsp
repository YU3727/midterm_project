<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	

			<c:forEach var="dto" items="${commentList}">
							<div id="${boardName}Comment${dto.num}"></div>
							<!-- Comment with nested comments-->
							<div class="d-flex mb-4 offset-md-1">
							<c:forEach begin="1" end="${dto.depth}" varStatus="s">
											<div class="d-flex mt-2">
												<div class="flex-shrink-0" style="width: 50px; height: 50px;"></div>
											</div>
									</c:forEach> 
								<!-- Parent comment-->
								<div class="flex-shrink-0" ><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
								<div class="ms-2 col-md-7">
									<div class="d-flex">
										<span class="me-auto p-2 fw-bold">
											${dto.writer}
										</span>
										<span class="p-2" id="cmntReg${dto.commentNum}" data-comment-num="${dto.num}">
											<script>
												$(document).ready(function(){
													let regDate = '${dto.regDate}';
													$('#cmntReg'+'${dto.commentNum}').text(getDateDiff(regDate));
												})
											</script>
										</span>
										
											<span class="p-2">
												<button class="btnToggle" style="border : 0px; background-color: transparent;" data-comment-num="${dto.commentNum}">
													<img alt="토글 버튼" src="/resources/images/menu/kebobMenu.png" style="width:12px; height:12px;">
												</button>
											</span>
										
										<span class="p-2 commentMenu" id="commentMenu${dto.commentNum}" style="display: none;">
											<div class="list-group">
												<c:if test="${dto.writer eq member.id}">
													<button type="button" class="list-group-item list-group-item-action updateMenu" data-comment-num='${dto.commentNum}'aria-current="true">수정</button>
													<button type="button" class="list-group-item list-group-item-action deleteMenu" data-comment-num='${dto.commentNum}'>삭제</button>
												</c:if>
												
												<c:if test="${boardName eq 'story'}">
													<button type="button" class="list-group-item list-group-item-action reportMenu" data-comment-num='${dto.commentNum}' data-comment-writer="${dto.writer}">신고하기</button>
												</c:if>
												
												<c:if test="${dto.depth eq 0}">
													<button type="button" class="list-group-item list-group-item-action subCommentMenu" data-comment-num='${dto.commentNum}'>답글달기</button>
												</c:if>
											</div>
										</span>
									</div>
									<div id="contents${dto.commentNum}">${dto.contents}</div>
									<!-- Child comment 1-->
									<!-- <c:forEach begin="1" end="${dto.depth}" varStatus="s">
										<c:if test="${s.last}">
											<div class="d-flex mt-4">
												<div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
												<div class="ms-3">
													<div class="fw-bold">Commenter Name</div>
													And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
												</div>
											</div>
										</c:if>
									</c:forEach> -->

						
								</div>
							</div>
						

			</c:forEach>


			<!-- 페이징 -->
			<div class="replyList">
				<div class="row">
					<div class="d-flex justify-content-center">
						<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item ${pager.before ?'disabled':''}">
							<a class="page-link" href="#" aria-label="Previous" data-board-page="1">
								<span aria-hidden="true">&laquo;</span>
							</a>
							</li>
						
							<li class="page-item ${pager.before ?'disabled':''}">
							<a class="page-link" href="#" aria-label="Previous" data-board-page="${pager.startNum-1}">
								<span aria-hidden="true">&lsaquo;</span>
							</a>
							</li>
							
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
								<li class="page-item"><a class="page-link" href="#" data-board-page="${i}">${i}</a></li>	
							</c:forEach>
							
							<li class="page-item ${pager.after ? 'disabled':''}">
							<a class="page-link" href="#"  aria-label="Next" data-board-page="${pager.lastNum+1}">
								<span aria-hidden="true">&rsaquo;</span>
							</a>
							</li>
							
							<li class="page-item ${pager.after ? 'disabled':''}">
							<a class="page-link" href="#"  aria-label="Next" data-board-page="${pager.totalPage}">
								<span aria-hidden="true">&raquo;</span>
							</a>
							</li>
						</ul>
						</nav>
					</div>
				</div>
			</div>




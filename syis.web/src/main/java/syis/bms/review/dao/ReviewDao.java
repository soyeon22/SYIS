package syis.bms.review.dao;

import java.util.List;

import syis.bms.review.domain.Review;

public interface ReviewDao {
	//특정 도서에 작성된 리뷰들 가져오기
	List<Review> getReviews(String bookCode);
	
	int addReview(Review review);
}

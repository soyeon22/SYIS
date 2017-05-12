package syis.bms.review.service;

import java.util.List;

import syis.bms.review.domain.Review;

public interface ReviewService {
	//리뷰 목록
	List<Review> listReviews(String bookCode);
	
	int insertReview(Review review);
}

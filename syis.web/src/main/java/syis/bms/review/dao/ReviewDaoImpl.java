package syis.bms.review.dao;

import java.util.List;

import syis.bms.config.Configuration;
import syis.bms.review.dao.mapper.ReviewMapper;
import syis.bms.review.domain.Review;

public class ReviewDaoImpl implements ReviewDao{
	ReviewMapper reviewMapper;
	
	public ReviewDaoImpl(){
		this.reviewMapper=Configuration.getMapper(ReviewMapper.class);
	}
	
	//리뷰 가져오기
	//Param : 도서 코드
	//return : 리뷰 배열
	public List<Review> getReviews(String bookCode){
		return reviewMapper.getReviews(bookCode);
	}
	
	public int addReview(Review review){
		return reviewMapper.addReview(review);
	}
}

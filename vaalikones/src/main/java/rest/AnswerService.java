package rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

import dao.AnswerDao;
import persist.Vastaukset;

@Path("/answerservice")
public class AnswerService {

	@Path("/updateanswer")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateAnswer(Vastaukset newAnswer) {
		AnswerDao.updateAnswer(newAnswer);
	}

	@Path("/addanswer")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public void addAnswerForNewQuestion(Vastaukset answer) {
		AnswerDao.addAnswerForNewQuestion(answer);
	}

	@Path("/deletequestionanswer/{id}")
	@DELETE
	public boolean deleteAnswersOfOneQuestion(@PathParam("id") int questionId) {
		return AnswerDao.deleteAnswersOfOneQuestion(questionId);
	}
}

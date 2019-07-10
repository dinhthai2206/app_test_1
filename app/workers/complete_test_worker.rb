class CompleteTestWorker
  include Sidekiq::Worker

  def perform(id)
    user_test = UserTest.find(id)
    user_test.completed! if user_test.uncompleted?
  end
end

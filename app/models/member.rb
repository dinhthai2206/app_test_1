class Member < User
  scope :count_tests, -> do
    joins('LEFT OUTER JOIN user_tests on user_tests.user_id = users.id')
      .select('users.*, COUNT(user_tests.test_id) as tests_count')
      .group('users.id')
  end

  ransacker :tests_count_sort do
    Arel.sql('tests_count')
  end
end

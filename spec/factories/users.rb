FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    last_name             {"阿部"}
    first_name            {"太朗"}
    last_name_kana        {"あべ"}
    first_name_kana       {"たろう"}
    birthday              {"2001-01-01"}
    introduction          {"よろしくお願いします"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}

    factory :seller do
      nickname              {"seller"}
      last_name             {"セラー"}
      first_name            {"太朗"}
      last_name_kana        {"せらー"}
      first_name_kana       {"たろう"}
    end
  end

end
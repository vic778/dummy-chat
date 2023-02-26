hash = { message: "Thank you for joining the JUUBIX platform, please check your email and verify your account!" }
json.post do
  json.title "Registration Successful"
  json.merge! hash
end

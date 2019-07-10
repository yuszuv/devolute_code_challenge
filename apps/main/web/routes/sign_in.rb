class DevoluteCodeChallenge::Main::Web

  route "sign_in" do |r|
    r.is do
      r.get do
        r.view "sign_in"
      end

      r.post do
        r.resolve "operations.sign_in" do |sign_up|
          sign_up.(r.params) do |m|
            m.success do |_user|
              flash.now[:notice] = "Success"
              r.view "welcome"
            end

            m.failure do |validation|
              response.status = 422
              flash.now[:alert] = "Error"
              r.view "sign_in", errors: validation
            end
          end
        end

      end
    end
  end
end

module Exporters
  class Users < Base

    def current_students
      export_for_season(Season.current)
    end

    private

    def export_for_season(season)
      students = User.with_role('student').with_team_kind(%w(sponsored voluntary)).
        where("teams.season_id" => season)

      generate(students, 'User ID', 'Name', 'Email', 'Country', 'Locality', 'Address', 'T-shirt size') do |u|
        [u.id, u.name, u.email, u.country, u.location, u.postal_address, u.tshirt_size]
      end
    end

  end
end

defmodule Discuss.TopicController do
	use Discuss.Web, :controller

	alias Discuss.Topic

	def new(conn, params) do
		changeset = Topic.changeset(%Topic{}, %{})

		sum = 1 + 1

		render conn, "new.html", changeset: changeset, sum: sum
	end

end

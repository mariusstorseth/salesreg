module ClientsHelper

  def client(client)
    return link_to client.name, client_path(client)
  end
end

defmodule DemoChat.RoomChannel do
    use Phoenix.Channel
  
    # Join: si el usuario se conecta a nuestro socket sin problemas, retornamos :ok y la conexión al socket
    def join("room:lobby", _message, socket) do
      {:ok, socket} 
    end
    
    # handle_in: recibe información del cliente al servidor
    def handle_in("new_msg", %{"body" => body, "name" => name}, socket) do
      broadcast! socket, "new_msg", %{body: body, name: name}
      {:noreply, socket}
    end
  
    #handle_out: envía información a los clientes conectados
    def handle_out("new_msg", payload, socket) do
      push socket, "new_msg", payload
      {:noreply, socket}
    end
  end
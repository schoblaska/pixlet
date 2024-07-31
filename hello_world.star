load("render.star", "render")

TRUMP_WIN = "https://clob.polymarket.com/rewards/markets/0xdd22472e552920b8438158ea7238bfadfa4f736aa4cee91a6b86c39ead110917"
KAMALA_WIN = "https://clob.polymarket.com/rewards/markets/0xc6485bb7ea46d7bb89beb9c91e7572ecfc72a6273789496f78bc5e989e4d1638"

def main():
    return render.Root(
        child = render.Text("Hello, World!")
    )

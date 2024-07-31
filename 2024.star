load("render.star", "render")
load("http.star", "http")

PRICE_ENDPOINT = "https://clob.polymarket.com/price?side=sell&token_id="
KAMALA_WIN = "69236923620077691027083946871148646972011131466059644796654161903044970987404"
TRUMP_WIN = "21742633143463906290569050155826241533067272736897614950488156847949938836455"
TTL = 300 # 5 minutes
FONT = "6x13"

def dec_str_to_percent(decimal_str):
    decimal_value = float(decimal_str)
    percentage_value = decimal_value * 100
    percentage_str = str(percentage_value)
    decimal_point_index = percentage_str.find('.')
    formatted_percentage = percentage_str[:decimal_point_index + 2] + '%'

    return formatted_percentage

def fetch_price(token):
    resp = http.get(PRICE_ENDPOINT + token, ttl_seconds = TTL)

    if resp.status_code != 200:
        fail("Coindesk request failed with status %d", resp.status_code)

    return resp.json()["price"]

def main():
    kamala = dec_str_to_percent(fetch_price(KAMALA_WIN))
    trump = dec_str_to_percent(fetch_price(TRUMP_WIN))

    return render.Root(
        child = render.Box( # This Box exists to provide vertical centering
            render.Column(
                expanded=True, # Use as much horizontal space as possible
                main_align="space_evenly", # Controls vertical alignment
                cross_align="center", # Controls horizontal alignment
                children = [
                    render.Text("D: %s" % kamala, color="#00f", font=FONT),
                    render.Text("R: %s" % trump, color="#f00", font=FONT),
                ],
            ),
        ),
    )

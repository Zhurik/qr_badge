import argparse
import sys

from typing import List

from qr_code import AUTH_ENUM, gen_wifi_str, gen_wifi_svg


def parse_args(args: List[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="SVG wifi generator")

    parser.add_argument(
        "-s",
        "--ssid",
        help="Wifi network SSID",
        required=True,
        dest="wifi_ssid",
        type=str,
        metavar="SSID",
    )

    parser.add_argument(
        "-p",
        "--password",
        help="Wifi network password",
        required=False,
        dest="wifi_password",
        type=str,
        metavar="PASSWORD",
    )

    parser.add_argument(
        "-t",
        "--type",
        help="Wifi network authenticantion type",
        required=False,
        dest="wifi_auth_type",
        choices=[t.value for t in AUTH_ENUM],
        default=AUTH_ENUM.WPA,
        metavar="TYPE",
    )

    parser.add_argument(
        "--hidden",
        help="If wifi network is hidden",
        required=False,
        action="store_true",
        dest="wifi_hidden",
        default=False,
    )

    parser.add_argument(
        "--path",
        help="Path to resulting SVG file",
        required=False,
        dest="svg_path",
        default="./qr.svg",
    )

    return parser.parse_args(args)


def main():
    args = parse_args(sys.argv[1:])

    print("Starting generating SVG file")
    wifi_str = gen_wifi_str(
        args.wifi_ssid,
        AUTH_ENUM(args.wifi_auth_type),
        args.wifi_password,
        args.wifi_hidden,
    )
    print("Generated wifi string")

    gen_wifi_svg(wifi_str, args.svg_path)
    print(f"Saved to {args.svg_path}")


if __name__ == "__main__":
    main()

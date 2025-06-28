from typing import Optional
import enum

import qrcode
import qrcode.image.svg


class AUTH_ENUM(str, enum.Enum):
    WPA = "WPA"
    WEP = "WEP"
    NOPASS = "nopass"


def gen_wifi_str(
    ssid: str,
    auth_type: AUTH_ENUM,
    password: Optional[str] = None,
    hidden: bool = False,
) -> str:
    hidden = "true" if hidden else "false"

    if auth_type == AUTH_ENUM.NOPASS:
        if password is not None:
            raise ValueError(f"No password for {auth_type.value}")

        return f"WIFI:T:nopass;S:{ssid};H;{hidden};;"

    if password is None:
        raise ValueError(f"Password missing for {auth_type.value}")

    return f"WIFI:T:{auth_type.value};S:{ssid};P:{password};H:{hidden};;"


def gen_wifi_svg(wifi_str: str, path_to_svg: str) -> None:
    img = qrcode.make(wifi_str, image_factory=qrcode.image.svg.SvgPathImage)
    img.save(path_to_svg)

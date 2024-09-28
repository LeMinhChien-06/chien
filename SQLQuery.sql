create database final5
go
use final5
go

create table bill
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    address      varchar(255),
    code         varchar(255),
    deleted      bit,
    name         varchar(255),
    order_date   date,
    phone        varchar(255),
    sub_total    float,
    total        float
)
go

create unique index UK8q38o07vmn6x2opedgsq9sewo
    on bill (code)
    where [code] IS NOT NULL
go

create table brand
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create unique index UKg7ft8mes72rnsk746b7ibyln2
    on brand (code)
    where [code] IS NOT NULL
go

create table collar
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create unique index UKmkxgqkhj5ndjpv1nvcfxdf7t3
    on collar (code)
    where [code] IS NOT NULL
go

create table color
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create unique index UKcbnc5ktj6whhh690w32k8cyh8
    on color (code)
    where [code] IS NOT NULL
go

create table customer
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    birth_day    date,
    code         varchar(255),
    deleted      bit,
    email        varchar(255),
    name         varchar(255),
    password     varchar(255),
    phone        varchar(255)
)
go

create table address
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    detail       varchar(255),
    phone        varchar(255),
    customer_id  int
        constraint FK93c3js0e22ll1xlu21nvrhqgg
            references customer
)
go

create unique index UKiw1xq6t67p4p17gr2d5dcrar1
    on customer (code, email, phone)
    where [code] IS NOT NULL AND [email] IS NOT NULL AND [phone] IS NOT NULL
go

create table elasticity
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create unique index UK8padggflv5sxp2u68ty11hx91
    on elasticity (code)
    where [code] IS NOT NULL
go

create table history
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    note         varchar(255),
    status       varchar(255)
        check ([status] = 'FAILED' OR [status] = 'CANCELLED' OR [status] = 'PENDING' OR [status] = 'SUCCESS'),
    bill_id      int
        constraint FKnlyavqy1p2ym7ngbv7wwu6umr
            references bill
)
go

create table image
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create unique index UKf8554665e4e0t819jc07asw22
    on image (code)
    where [code] IS NOT NULL
go

create table material
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create unique index UKt9kjl2b3iqg9sv9xe06fcxcya
    on material (code)
    where [code] IS NOT NULL
go

create table origin
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create unique index UK7e5g3f1j7w3jfye6tninigdro
    on origin (code)
    where [code] IS NOT NULL
go

create table payment
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255)
)
go

create unique index UKopor0kv54jt58n364jog9bu2i
    on payment (code)
    where [code] IS NOT NULL
go

create table product
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create unique index UKh3w5r1mx6d0e5c6um32dgyjej
    on product (code)
    where [code] IS NOT NULL
go

create table role
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255)
)
go

create unique index UKc36say97xydpmgigg38qv5l2p
    on role (code)
    where [code] IS NOT NULL
go

create table size
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create unique index UK2cl2qxxrob1p3d291xr99no9j
    on size (code)
    where [code] IS NOT NULL
go

create table sleeve
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create unique index UKxeixx6xuy44keusgk80bicdd
    on sleeve (code)
    where [code] IS NOT NULL
go

create table staff
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    address      varchar(255),
    birth_day    date,
    citizen_id   varchar(255),
    code         varchar(255),
    deleted      bit,
    email        varchar(255),
    name         varchar(255),
    note         varchar(255),
    password     varchar(255),
    phone        varchar(255),
    role_id      int
        constraint FK5bbdfuitxii0b63v2v3f0r22x
            references role
)
go

create table cart
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    status       varchar(255)
        check ([status] = 'PENDING' OR [status] = 'SUCCESS'),
    staff_id     int
        constraint FKrdd1t50ij6m23rtc7n9tospix
            references staff
)
go

create unique index UKr4h7xlxecyyylk0xdc7u0f7lf
    on staff (code, email, phone)
    where [code] IS NOT NULL AND [email] IS NOT NULL AND [phone] IS NOT NULL
go

create table style
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create unique index UKqiy003f5r7e6ey7l5y3apiu76
    on style (code)
    where [code] IS NOT NULL
go

create table texture
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create unique index UKltw1388iiex1fh3yyexn8ll9s
    on texture (code)
    where [code] IS NOT NULL
go

create table thickness
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    name         varchar(255)
)
go

create table product_detail
(
    id            int identity
        primary key,
    created_date  date,
    updated_date  date,
    code          varchar(255),
    deleted       bit,
    name          varchar(255),
    price         float,
    quantity      int,
    brand_id      int
        constraint FKn29xx33y0vxapbc6ntf4kldxr
            references brand,
    collar_id     int
        constraint FKrs2l68eovv4jbptsnrw9xxk29
            references collar,
    color_id      int
        constraint FK99vj2np1gk1robp8n6htiweii
            references color,
    elasticity_id int
        constraint FKebv5c5kn3d3sxjjken6xm8ewa
            references elasticity,
    image_id      int
        constraint FKlk351wm82fyehkqmb1lki65h6
            references image,
    material_id   int
        constraint FKelrbk54wt31vv07h3us1gap2c
            references material,
    origin_id     int
        constraint FKnb3b3wpn7hlkbs5o6vhonn46c
            references origin,
    product_id    int
        constraint FKilxoi77ctyin6jn9robktb16c
            references product,
    size_id       int
        constraint FKcum8u2vfvebmmc4xo8de3k35s
            references size,
    sleeve_id     int
        constraint FKaulbngl3gskh8tll54wyh5ckg
            references sleeve,
    style_id      int
        constraint FK56s4hqmp09omp2w84hijq3jyc
            references style,
    texture_id    int
        constraint FKkk0ba59xpfjat6ceh4fms3ljw
            references texture,
    thickness_id  int
        constraint FKo97vo0ox06s9fp5dxh6dq2san
            references thickness
)
go

create table bill_detail
(
    id                int identity
        primary key,
    created_date      date,
    updated_date      date,
    quantity          int,
    bill_id           int
        constraint FKeolgwyayei3o80bb7rj7t207q
            references bill,
    product_detail_id int
        constraint FK5wgs68xq0wq0ebia10snilq9v
            references product_detail
)
go

create unique index UK18yn4vr4gusinr921wec1ui0w
    on bill_detail (bill_id)
    where [bill_id] IS NOT NULL
go

create table cart_detail
(
    id                int identity
        primary key,
    created_date      date,
    updated_date      date,
    quantity          int,
    cart_id           int
        constraint FKrg4yopd2252nwj8bfcgq5f4jp
            references cart,
    product_detail_id int
        constraint FK3c8gudcdnngwh5k2g2n25kkqk
            references product_detail
)
go

create unique index UKndx952w0v9kxawibxhciotx1w
    on product_detail (code)
    where [code] IS NOT NULL
go

create unique index UKnkdkv6j2y4egsd7j34hf0xbvt
    on thickness (code)
    where [code] IS NOT NULL
go

create table voucher
(
    id           int identity
        primary key,
    created_date date,
    updated_date date,
    code         varchar(255),
    deleted      bit,
    end_date     date,
    max_percent  int,
    min_amount   int,
    name         varchar(255),
    quantity     int,
    start_date   date,
    type_ticket  varchar(255)
)
go

create unique index UKpvh1lqheshnjoekevvwla03xn
    on voucher (code)
    where [code] IS NOT NULL
go

create table voucher_customer
(
    customer_id int not null
        constraint FKq63rrti3v4ap5eejsod9x45y3
            references voucher,
    voucher_id  int not null
        constraint FKbplw48armhqj6htasirqwxi7x
            references customer
)
go


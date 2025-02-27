create table consumers (
  id bigint generated by default as identity primary key,
  name varchar(20) not null default 'guest',
  email varchar(30),
  phone varchar(20),
  bank_account varchar(30),
  id_auth uuid not null,
  FOREIGN KEY (id_auth) REFERENCES auth.users (id)
);
-------------------------------------------------------
create table providers (
  id bigint generated by default as identity primary key,
  name varchar(20) not null default 'guest',
  email varchar(30),
  phone varchar(20),
  address text,
  bank_account varchar(30),
  id_auth uuid not null,
  FOREIGN KEY (id_auth) REFERENCES auth.users (id)
);
-------------------------------------------------------
create table stations (
  id bigint generated by default as identity primary key,
  location text,
  work_time varchar(30),
  rating varchar(30),
  status varchar(30),
  CONSTRAINT check_status CHECK (
    status IN ('availabe', 'booked', 'off duty', 'working')
  ),
  image_url varchar(50),
  id_prov bigint not null,
  FOREIGN KEY (id_prov) REFERENCES providers (id)
);
-------------------------------------------------------
create table orders (
  id bigint generated by default as identity primary key,
  date varchar(30),
  price varchar(30),
  status varchar(30),
  CONSTRAINT check_status CHECK (
    status IN ('waiting', 'rejected', 'confirmed')
  ),
  id_cons bigint not null,
  FOREIGN KEY (id_cons) REFERENCES consumers (id),
  id_prov bigint not null,
  FOREIGN KEY (id_prov) REFERENCES providers (id)
);
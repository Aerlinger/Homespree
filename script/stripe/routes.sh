echo
echo ======================= Routes =======================

echo /v1/charges
echo /v1/charges/{CHARGE_ID}
echo /v1/coupons
echo /v1/coupons/{COUPON_ID}
echo /v1/customers
echo /v1/customers/{CUSTOMER_ID}
echo /v1/customers/{CUSTOMER_ID}/subscription
echo /v1/invoices
echo /v1/invoices/{INVOICE_ID}
echo /v1/invoices/{INVOICE_ID}/lines
echo /v1/invoiceitems
echo /v1/invoiceitems/{INVOICEITEM_ID}
echo /v1/plans
echo /v1/plans/{PLAN_ID}
echo /v1/tokens
echo /v1/tokens/{TOKEN_ID}
echo /v1/events
echo /v1/events/{EVENT_ID}

echo
echo ===================== Responses =====================
echo 200 OK - Everything worked as expected.
echo 400 Bad Request - Often missing a required parameter.
echo 401 Unauthorized - No valid API key provided.
echo 402 Request Failed - Parameters were valid but request failed.
echo 404 Not Found - The requested item doesn't exist.
echo 500, 502, 503, 504 Server errors - something went wrong on Stripe's end.

echo
echo ===================== Errors =====================
echo invalid_request_error	Invalid request errors arise when your request has invalid parameters.
echo api_error	API errors cover any other type of problem (e.g. a temporary problem with Stripe's servers) and should turn up only very infrequently.
echo card_error	Card errors are the most common type of error you should expect to handle. They result when the user enters a card that can't be charged for some reason.
echo Codes
echo incorrect_number	The card number is incorrect.
echo invalid_number	The card number is not a valid credit card number.
echo invalid_expiry_month	The card's expiration month is invalid.
echo invalid_expiry_year	The card's expiration year is invalid.
echo invalid_cvc	The card's security code is invalid.
echo expired_card	The card has expired.
echo incorrect_cvc	The card's security code is incorrect.
echo incorrect_zip	The card's zip code failed validation.
echo card_declined	The card was declined.
echo missing	There is no card on a customer that is being charged.
echo processing_error	An error occurred while processing the card.

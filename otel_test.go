package dpotelgo

import (
	"context"
	"testing"
	"time"
)

func TestSetup(t *testing.T) {
	var cfg Config
	cfg.OtelServiceName = "testservice"
	cfg.OtelBatchTimeout = time.Second
	cfg.OtelExporterOtlpEndpoint = "localhost:4317"

	shutdown, err := SetupOTelSDK(context.Background(), cfg)

	if shutdown == nil {
		t.Errorf("shutdown callback is null")
	}
	if err != nil {
		t.Errorf("err is not null %s", err)
	}
}

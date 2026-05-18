class AppConfig {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://uevtfoibbyprqyoyhndc.supabase.co',
  );

  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVldnRmb2liYnlwcnF5b3lobmRjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzg4MDY3MzYsImV4cCI6MjA5NDM4MjczNn0.BpIoEpSvfOZVtyWywxDfoxdDA9zVGxrPUC5a7u_ulI0',
  );
}

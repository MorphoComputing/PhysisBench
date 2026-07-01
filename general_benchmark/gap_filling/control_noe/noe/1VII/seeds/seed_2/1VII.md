# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1VII\seeds\seed_2\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 5.461 A
- tm_score_ca_ordered: 0.15150880278461235
- heavy_atom_rmsd: 6.154 A
- sidechain_heavy_atom_rmsd: 6.789 A
- **all-atom quality (honest):** heavy 6.154 A, sidechain 6.789 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 51
- bin_accuracy: 0.451

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** P21-K30 → 3 conflicts (75%)
- explained: 3/4 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.118), conflicts/hub=1.0, max_incompat=3.83Å, chain_span=0.588
- **fix-first:** [LOW_CONFLICT] Root cause(s): P21-K30 — explain ~3/4 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q26** — severity 1.55, 1 conflict(s); suspect input ~`L22` (group: pull_in)
  - pull-in (wants closer): L22@4.0Å(now 7.4,conf 0.45)
  - L22↔K30: targets 4.0/4.0Å but partners are 11.5Å apart → too_far_apart by 3.5Å
- **K24** — severity 1.44, 1 conflict(s); suspect input ~`P21` (group: pull_in)
  - pull-in (wants closer): N27@4.0Å(now 7.0,conf 0.45)
  - N27↔P21: targets 4.0/4.7Å but partners are 12.5Å apart → too_far_apart by 3.8Å
- **F6** — severity 1.00, 1 conflict(s); suspect input ~`V9` (group: pull_in)
  - pull-in (wants closer): D3@4.0Å(now 9.0,conf 0.45)
  - D3↔V9: targets 4.0/4.3Å but partners are 10.8Å apart → too_far_apart by 2.5Å
- **F10** — severity 0.66, 1 conflict(s); suspect input ~`R14` (group: pull_in)
  - pull-in (wants closer): K29@4.9Å(now 7.8,conf 0.35)
  - K29↔R14: targets 4.9/5.2Å but partners are 12.7Å apart → too_far_apart by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=9 · 3-10(G)=4 · coil(C)=1

```
EGHHEHHEHHHHHHHHEHGHHEHGEGHHCHEEHE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=10 · sheet=16
  - D3 ↔ K7  (helix)
  - F6 ↔ F10  (helix)
  - K7 ↔ G11  (helix)
  - V9 ↔ T13  (helix)
  - F10 ↔ R14  (helix)
  - G11 ↔ S15  (helix)
  - M12 ↔ A16  (helix)
  - R14 ↔ A18  (helix)
  - A16 ↔ L20  (helix)
  - W23 ↔ N27  (helix)
  - L1 ↔ A8  (sheet)
  - L1 ↔ F17  (sheet)
  - D5 ↔ F17  (sheet)
  - D5 ↔ L22  (sheet)
  - A8 ↔ F17  (sheet)
  - F17 ↔ L22  (sheet)
  - F17 ↔ Q25  (sheet)
  - F17 ↔ E31  (sheet)
  - F17 ↔ K32  (sheet)
  - F17 ↔ L34  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=228 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=116 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3444 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

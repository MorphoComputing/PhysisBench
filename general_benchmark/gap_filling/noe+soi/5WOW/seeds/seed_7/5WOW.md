# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\5WOW\seeds\seed_7\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.960 A
- tm_score_ca_ordered: 0.12449596566821006
- heavy_atom_rmsd: 8.169 A
- sidechain_heavy_atom_rmsd: 8.974 A
- **all-atom quality (honest):** heavy 8.169 A, sidechain 8.974 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 176
- bin_accuracy: 0.438

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C3-P4 → 6 conflicts (50%); D13 → 3 conflicts (25%)
- explained: 9/12 conflicts by 2 root cause(s)
- metrics: hubs=7 (frac 0.189), conflicts/hub=1.7, max_incompat=3.74Å, chain_span=0.757
- **fix-first:** [LOW_CONFLICT] Root cause(s): C3-P4 + D13 — explain ~9/12 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y30** — severity 6.92, 5 conflict(s); suspect input ~`V34` (group: push_out)
  - pull-in (wants closer): C3@3.8Å(now 8.8,conf 0.58)
  - push-out (wants farther): Y37@17.8Å(now 12.8,conf 0.40)
  - C3↔V34: targets 3.8/11.3Å but partners are 18.9Å apart → too_far_apart by 3.7Å
  - C3↔D36: targets 3.8/16.4Å but partners are 23.7Å apart → too_far_apart by 3.5Å
  - C3↔P35: targets 3.8/14.4Å but partners are 20.7Å apart → too_far_apart by 2.5Å
- **R9** — severity 1.56, 2 conflict(s); suspect input ~`Y27` (group: push_out)
  - push-out (wants farther): V2@9.7Å(now 3.5,conf 0.66), P4@10.3Å(now 6.5,conf 0.49)
  - P4↔Y27: targets 10.3/4.1Å but partners are 4.3Å apart → too_close_together by 1.8Å
  - V2↔Y27: targets 9.7/4.1Å but partners are 3.8Å apart → too_close_together by 1.8Å
- **I21** — severity 1.51, 1 conflict(s); suspect input ~`D13` (group: pull_in)
  - pull-in (wants closer): D13@4.3Å(now 7.4,conf 0.41)
  - push-out (wants farther): C28@6.9Å(now 3.6,conf 0.84), P17@8.2Å(now 5.1,conf 0.52)
  - D15↔D13: targets 9.5/4.3Å but partners are 1.4Å apart → too_close_together by 3.7Å
- **C10** — severity 1.05, 1 conflict(s); suspect input ~`P4` (group: push_out)
  - push-out (wants farther): P4@11.6Å(now 8.2,conf 0.34)
  - Y27↔P4: targets 4.2/11.6Å but partners are 4.3Å apart → too_close_together by 3.1Å
- **D13** — severity 1.05, 1 conflict(s); suspect input ~`I6` (group: pull_in)
  - pull-in (wants closer): I21@4.3Å(now 7.4,conf 0.41)
  - I21↔I6: targets 4.3/11.3Å but partners are 4.3Å apart → too_close_together by 2.6Å
- **Y37** — severity 0.50, 1 conflict(s); suspect input ~`V34` (group: push_out)
  - push-out (wants farther): D33@11.6Å(now 7.2,conf 0.69), Y32@14.0Å(now 10.3,conf 0.59), G1@21.5Å(now 17.2,conf 0.52), Y30@17.8Å(now 12.8,conf 0.40), P31@16.0Å(now 12.4,conf 0.40)
  - D33↔V34: targets 11.6/5.7Å but partners are 3.7Å apart → too_close_together by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=14 · 3-10(G)=3 · coil(C)=2

```
EHHHHHEEEEEHHHEGHHHHHHEHHEGGCHEEECEHE
```

## Backbone H-bond Network

- total=37 · helix(i→i+4)=7 · sheet=30
  - V2 ↔ I6  (helix)
  - D13 ↔ P17  (helix)
  - S14 ↔ G18  (helix)
  - P17 ↔ I21  (helix)
  - G18 ↔ C22  (helix)
  - C20 ↔ G24  (helix)
  - I21 ↔ N25  (helix)
  - G1 ↔ L7  (sheet)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ R9  (sheet)
  - G1 ↔ C10  (sheet)
  - G1 ↔ R11  (sheet)
  - G1 ↔ D15  (sheet)
  - L7 ↔ D15  (sheet)
  - L7 ↔ R23  (sheet)
  - L7 ↔ G26  (sheet)
  - Q8 ↔ D15  (sheet)
  - Q8 ↔ R23  (sheet)
  - Q8 ↔ G26  (sheet)
  - R9 ↔ D15  (sheet)
  - … +17 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=246 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=171 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.0002 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=16 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

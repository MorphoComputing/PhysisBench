# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\5WOW\seeds\seed_4\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 5.066 A
- tm_score_ca_ordered: 0.2076888267668072
- heavy_atom_rmsd: 6.403 A
- sidechain_heavy_atom_rmsd: 7.624 A
- **all-atom quality (honest):** heavy 6.403 A, sidechain 7.624 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 176
- bin_accuracy: 0.557

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G1-C3 → 8 conflicts (50%); G29-Y30 → 4 conflicts (25%)
- explained: 12/16 conflicts by 2 root cause(s)
- metrics: hubs=7 (frac 0.189), conflicts/hub=2.3, max_incompat=3.67Å, chain_span=0.973
- **fix-first:** [LOW_CONFLICT] Root cause(s): G1-C3 + G29-Y30 — explain ~12/16 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y30** — severity 4.28, 4 conflict(s); suspect input ~`C3` (group: push_out)
  - pull-in (wants closer): R23@7.4Å(now 11.4,conf 0.79), C3@3.8Å(now 9.5,conf 0.58)
  - push-out (wants farther): Y37@17.3Å(now 10.9,conf 0.26)
  - R23↔C3: targets 7.4/3.8Å but partners are 14.3Å apart → too_far_apart by 3.1Å
  - N25↔C3: targets 10.8/3.8Å but partners are 16.4Å apart → too_far_apart by 1.8Å
  - G24↔C3: targets 10.2/3.8Å but partners are 15.7Å apart → too_far_apart by 1.7Å
- **Y37** — severity 2.33, 4 conflict(s); suspect input ~`V34` (group: push_out)
  - push-out (wants farther): D33@11.2Å(now 8.5,conf 0.59), G1@21.4Å(now 10.1,conf 0.43), P31@16.4Å(now 9.0,conf 0.40), Y32@13.3Å(now 8.5,conf 0.40), Y30@17.3Å(now 10.9,conf 0.26)
  - G1↔V34: targets 21.4/5.7Å but partners are 12.0Å apart → too_close_together by 3.6Å
  - G1↔Y32: targets 21.4/13.3Å but partners are 6.1Å apart → too_close_together by 2.0Å
  - P31↔V34: targets 16.4/5.7Å but partners are 9.1Å apart → too_close_together by 1.6Å
- **C22** — severity 2.33, 3 conflict(s); suspect input ~`R12` (group: pull_in)
  - pull-in (wants closer): G29@4.5Å(now 8.2,conf 0.39), R12@5.4Å(now 8.0,conf 0.24)
  - D13↔G29: targets 4.1/4.5Å but partners are 11.3Å apart → too_far_apart by 2.6Å
  - G29↔R12: targets 4.5/5.4Å but partners are 12.6Å apart → too_far_apart by 2.7Å
  - N25↔R12: targets 8.8/5.4Å but partners are 16.9Å apart → too_far_apart by 2.6Å
- **G1** — severity 1.42, 2 conflict(s); suspect input ~`Y37` (group: push_out)
  - push-out (wants farther): P4@10.2Å(now 4.9,conf 0.69), Q8@10.7Å(now 3.9,conf 0.59), L7@11.5Å(now 3.4,conf 0.52), K5@11.8Å(now 3.7,conf 0.49), Y37@21.4Å(now 10.1,conf 0.43), I6@12.1Å(now 3.6,conf 0.40)
  - Q8↔Y37: targets 10.7/21.4Å but partners are 8.7Å apart → too_close_together by 2.0Å
  - Y37↔A19: targets 21.4/6.1Å but partners are 11.6Å apart → too_close_together by 3.7Å
- **G29** — severity 1.00, 1 conflict(s); suspect input ~`G26` (group: pull_in)
  - pull-in (wants closer): C22@4.5Å(now 8.2,conf 0.39), R23@4.8Å(now 7.9,conf 0.36)
  - push-out (wants farther): P35@15.0Å(now 12.3,conf 0.52), D36@16.2Å(now 12.9,conf 0.52)
  - D36↔G26: targets 16.2/7.4Å but partners are 6.8Å apart → too_close_together by 2.0Å
- **I6** — severity 0.62, 1 conflict(s); suspect input ~`G1` (group: push_out)
  - push-out (wants farther): V2@10.2Å(now 7.2,conf 0.59), C3@8.0Å(now 4.2,conf 0.59), G1@12.1Å(now 3.6,conf 0.40)
  - C3↔G1: targets 8.0/12.1Å but partners are 2.5Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=20 · 3-10(G)=4 · coil(C)=3

```
EHHHHGEEECEGHHHHEGCEEEEEHCEGEEEEEEEHE
```

## Backbone H-bond Network

- total=78 · helix(i→i+4)=0 · sheet=78
  - G1 ↔ L7  (sheet)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ R9  (sheet)
  - G1 ↔ R11  (sheet)
  - G1 ↔ P17  (sheet)
  - G1 ↔ C20  (sheet)
  - G1 ↔ I21  (sheet)
  - L7 ↔ P17  (sheet)
  - L7 ↔ C20  (sheet)
  - L7 ↔ I21  (sheet)
  - L7 ↔ C22  (sheet)
  - L7 ↔ R23  (sheet)
  - L7 ↔ G24  (sheet)
  - L7 ↔ Y27  (sheet)
  - Q8 ↔ P17  (sheet)
  - Q8 ↔ C20  (sheet)
  - Q8 ↔ I21  (sheet)
  - Q8 ↔ C22  (sheet)
  - Q8 ↔ R23  (sheet)
  - Q8 ↔ G24  (sheet)
  - … +58 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=185 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=117 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.2232 (restraint satisfaction; lower=better)
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

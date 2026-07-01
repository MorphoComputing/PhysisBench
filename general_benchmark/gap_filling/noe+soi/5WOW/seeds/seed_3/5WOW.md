# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\5WOW\seeds\seed_3\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.316 A
- tm_score_ca_ordered: 0.09426694757214137
- heavy_atom_rmsd: 8.915 A
- sidechain_heavy_atom_rmsd: 10.147 A
- **all-atom quality (honest):** heavy 8.915 A, sidechain 10.147 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 17
- distogram_pairs: 177
- bin_accuracy: 0.373

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G1 → 5 conflicts (83%)
- explained: 5/6 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.108), conflicts/hub=1.5, max_incompat=6.9Å, chain_span=0.973
- **fix-first:** [LOW_CONFLICT] Root cause(s): G1 — explain ~5/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G1** — severity 2.22, 3 conflict(s); suspect input ~`A19` (group: push_out)
  - push-out (wants farther): K5@12.4Å(now 3.8,conf 0.82), P31@12.1Å(now 7.4,conf 0.67), P4@9.5Å(now 4.8,conf 0.58), L7@12.3Å(now 5.2,conf 0.52), Q8@13.6Å(now 6.9,conf 0.52), Y37@22.7Å(now 15.3,conf 0.49), I6@11.6Å(now 5.5,conf 0.34)
  - Y37↔A19: targets 22.7/6.1Å but partners are 9.7Å apart → too_close_together by 6.9Å
  - P4↔Y37: targets 9.5/22.7Å but partners are 11.4Å apart → too_close_together by 1.8Å
  - Q8↔A19: targets 13.6/6.1Å but partners are 5.5Å apart → too_close_together by 2.0Å
- **R23** — severity 1.52, 1 conflict(s); suspect input ~`G26` (group: pull_in)
  - pull-in (wants closer): C20@7.1Å(now 11.0,conf 0.82), G29@4.8Å(now 8.1,conf 0.36)
  - C20↔G26: targets 7.1/3.8Å but partners are 13.6Å apart → too_far_apart by 2.6Å
- **I6** — severity 0.65, 1 conflict(s); suspect input ~`G1` (group: push_out)
  - push-out (wants farther): C3@8.0Å(now 4.1,conf 0.72), V2@10.5Å(now 7.2,conf 0.67), G1@11.6Å(now 5.5,conf 0.34)
  - C3↔G1: targets 8.0/11.6Å but partners are 1.7Å apart → too_close_together by 1.9Å
- **Y37** — severity 0.55, 1 conflict(s); suspect input ~`V34` (group: push_out)
  - push-out (wants farther): G1@22.7Å(now 15.3,conf 0.49), P31@16.7Å(now 13.8,conf 0.49), Y32@13.7Å(now 9.5,conf 0.49), Y30@17.8Å(now 15.0,conf 0.43)
  - G1↔V34: targets 22.7/5.7Å but partners are 14.5Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=17 · 3-10(G)=2 · coil(C)=2

```
EHHHEHEEEHHHEHHEHHEHCGEEHEEEEHECEGHHE
```

## Backbone H-bond Network

- total=70 · helix(i→i+4)=5 · sheet=65
  - V2 ↔ I6  (helix)
  - I6 ↔ C10  (helix)
  - C10 ↔ S14  (helix)
  - R11 ↔ D15  (helix)
  - S14 ↔ G18  (helix)
  - G1 ↔ L7  (sheet)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ R9  (sheet)
  - G1 ↔ C16  (sheet)
  - G1 ↔ A19  (sheet)
  - K5 ↔ D13  (sheet)
  - K5 ↔ C16  (sheet)
  - K5 ↔ A19  (sheet)
  - L7 ↔ D13  (sheet)
  - L7 ↔ C16  (sheet)
  - L7 ↔ A19  (sheet)
  - L7 ↔ R23  (sheet)
  - L7 ↔ G24  (sheet)
  - L7 ↔ G26  (sheet)
  - L7 ↔ Y27  (sheet)
  - … +50 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=236 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=159 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.5386 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=17 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

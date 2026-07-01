# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\fusion\noe+homolog\1VII\seeds\seed_1\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 2.060 A
- tm_score_ca_ordered: 0.5506749530340317
- heavy_atom_rmsd: 3.767 A
- sidechain_heavy_atom_rmsd: 4.694 A
- **all-atom quality (honest):** heavy 3.767 A, sidechain 4.694 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 331
- bin_accuracy: 0.746

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F17 → 30 conflicts (53%); L28 → 22 conflicts (39%)
- explained: 52/57 conflicts by 2 root cause(s)
- metrics: hubs=8 (frac 0.235), conflicts/hub=7.1, max_incompat=5.88Å, chain_span=0.765
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F17 + L28 — explain ~52/57 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L28** — severity 13.63, 9 conflict(s); suspect input ~`Q25` (group: pull_in)
  - pull-in (wants closer): K24@4.0Å(now 6.7,conf 0.45), K32@4.0Å(now 8.1,conf 0.45), E31@4.3Å(now 7.5,conf 0.41)
  - K24↔K32: targets 4.0/4.0Å but partners are 13.3Å apart → too_far_apart by 5.3Å
  - K32↔Q25: targets 4.0/4.3Å but partners are 13.2Å apart → too_far_apart by 4.8Å
  - Q25↔E31: targets 4.3/4.3Å but partners are 12.6Å apart → too_far_apart by 3.9Å
- **F17** — severity 13.47, 15 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): F6@4.9Å(now 8.8,conf 0.35), K29@5.2Å(now 8.7,conf 0.26)
  - F6↔D5: targets 4.9/13.5Å but partners are 4.0Å apart → too_close_together by 4.6Å
  - L20↔F6: targets 5.8/4.9Å but partners are 14.3Å apart → too_far_apart by 3.7Å
  - Q25↔F6: targets 4.7/4.9Å but partners are 13.2Å apart → too_far_apart by 3.6Å
- **K32** — severity 9.61, 8 conflict(s); suspect input ~`P21` (group: pull_in)
  - pull-in (wants closer): L28@4.0Å(now 8.1,conf 0.45)
  - L28↔P21: targets 4.0/16.9Å but partners are 8.3Å apart → too_close_together by 4.5Å
  - L28↔L20: targets 4.0/15.8Å but partners are 7.3Å apart → too_close_together by 4.4Å
  - L28↔L22: targets 4.0/15.5Å but partners are 7.3Å apart → too_close_together by 4.2Å
- **E31** — severity 9.01, 9 conflict(s); suspect input ~`N19` (group: pull_in)
  - pull-in (wants closer): L28@4.3Å(now 7.5,conf 0.41)
  - L28↔N19: targets 4.3/17.9Å but partners are 10.1Å apart → too_close_together by 3.4Å
  - L28↔A18: targets 4.3/16.4Å but partners are 8.6Å apart → too_close_together by 3.5Å
  - L28↔L20: targets 4.3/15.0Å but partners are 7.3Å apart → too_close_together by 3.4Å
- **F6** — severity 8.96, 9 conflict(s); suspect input ~`F17` (group: push_out)
  - pull-in (wants closer): F17@4.9Å(now 8.8,conf 0.35)
  - push-out (wants farther): G33@12.9Å(now 10.1,conf 0.34)
  - F17↔L20: targets 4.9/14.9Å but partners are 5.8Å apart → too_close_together by 4.2Å
  - F17↔N19: targets 4.9/14.8Å but partners are 5.9Å apart → too_close_together by 4.0Å
  - P21↔F17: targets 17.6/4.9Å but partners are 8.9Å apart → too_close_together by 3.8Å
- **R14** — severity 2.24, 4 conflict(s); suspect input ~`L1` (group: pull_in)
  - pull-in (wants closer): L1@5.2Å(now 8.8,conf 0.26)
  - N19↔L1: targets 8.9/5.2Å but partners are 16.8Å apart → too_far_apart by 2.7Å
  - G33↔L1: targets 16.5/5.2Å but partners are 9.2Å apart → too_close_together by 2.1Å
  - A18↔L1: targets 6.5/5.2Å but partners are 13.8Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=7 · 3-10(G)=5 · coil(C)=2

```
EGGHGHHGHHHEEHHHHHHEHGHHHEHHHHEECC
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=7 · sheet=7
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - W23 ↔ N27  (helix)
  - Q25 ↔ K29  (helix)
  - L1 ↔ M12  (sheet)
  - L1 ↔ T13  (sheet)
  - M12 ↔ L20  (sheet)
  - T13 ↔ L20  (sheet)
  - L20 ↔ Q26  (sheet)
  - Q26 ↔ E31  (sheet)
  - Q26 ↔ K32  (sheet)

## Solvent Accessibility (burial)

- buried=7 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=111 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=25 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2463 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
